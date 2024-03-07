--------------------------------------------------------------------------------
-- FIFO double port
-- F.Thiebolt
--------------------------------------------------------------------------------

-- Definition des librairies
library IEEE;

-- Definition des portee d'utilisation
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- -----------------------------------------------------------------------------
-- Definition de l'entite
-- -----------------------------------------------------------------------------
entity fifo is

	-- definition des parametres generiques
	generic	(
		-- largeur du bus de donnees
		DBUS_WIDTH : natural := 32;

		-- largeur du bus adr R/W pour acces fifo
		ABUS_WIDTH : natural := 3 );	-- soit 2**3 emplacements

	-- definition des entrees/sorties
	port 	(
		-- signaux de controle de la FIFO
		CLK,RST	: in std_logic;	-- RST is active low
		REN,WEN	: in std_logic;	-- Read & Write Enable are actives low

		-- bus de donnees en entree
		DI	: in std_logic_vector(DBUS_WIDTH-1 downto 0);

		-- bus de donnees en sortie
		DO	: out std_logic_vector(DBUS_WIDTH-1 downto 0);

		-- indicateurs d'etat
		EMPTY,MID,FULL	: buffer std_logic );

end fifo;

-- -----------------------------------------------------------------------------
-- Definition de l'architecture de la fifo
-- -----------------------------------------------------------------------------
architecture behavior of fifo is

	-- definitions de types (index type default is integer)
	type FILE_REG_typ is array (0 to (2**ABUS_WIDTH)-1) of std_logic_vector (DBUS_WIDTH-1 downto 0);

	-- definition des ressources internes

	-- registres
	signal REGS : FILE_REG_typ; -- le banc de registres interne de la fifo

	-- pointeurs lecture et ecriture
	signal W_ADR,R_ADR	: std_logic_vector (ABUS_WIDTH-1 downto 0);

begin

------------------------------------------------------------------
-- Mise a jour des sorties dans le domaine concourant

----------------------------------------------------------------------------
-- Process P_WRITE effectue l'ecriture de la donnee dans la file ainsi que
--		la mise a jour du pointeur d'adresse ecriture.
--		Le pointeur pointe toujours sur l'emplacement de la prochaine ecriture.
P_WRITE:	process(CLK)
begin
	if rising_edge(CLK) then
		-- test du RST
		if RST='0' then
		  W_ADR <= (others => '0');
		elsif WEN='0'then
		  REGS(conv_integer(W_ADR)) <= DI;
		  W_ADR <= W_ADR + 1;
		end if;
	end if;
end process P_WRITE;

---------------------------------------------------------------------------
-- Process P_READ sort la donnee sur le bus et effectue la mise a jour
--		du pointeur d'adresse lecture.
--		Le pointeur pointe toujours sur l'emplacement de la prochaine lecture
P_READ:	process(CLK)
begin
	if rising_edge(CLK) then
		-- test du RST
		if RST='0' then
            R_ADR <= (others => '0');
            DO <= (others => 'Z');
        elsif REN = '0' then
            -- Lecture selon vide ou pas
            if EMPTY = '1' then
                DO <= (others => '0');
            else
                DO <= REGS(conv_integer(R_ADR));
                -- Incrémentation pointeur
                R_ADR <= R_ADR + 1;
            end if;
        elsif FULL = '1' and WEN = '0' then
            -- Incrémentation pointeur vers la donnée la plus ancienne
            R_ADR <= R_ADR + 1;
            DO <= (others => 'Z');
        else
            DO <= (others => 'Z');
		end if;
	end if;
end process P_READ;

-------------------------------------------------------------------------
-- Process P_EMPTY indique '1' la FIFO est vide '0' sinon, cette information
--		 etant mise a jour sur front montant d'horloge
P_EMPTY:	process(CLK)
	variable next_R : std_logic_vector (ABUS_WIDTH-1 downto 0);
begin
	if rising_edge(CLK) then
		-- test du RST
		if RST='0' then
		  EMPTY <= '1';
		-- Si on lit mais qu'on écrit pas et que les deux pointeurs sont au même endroit après le coup d'horloge, alors FIFO vide
		elsif WEN = '1' and REN = '0' and W_ADR = R_ADR+1 then
		  EMPTY <= '1';
		elsif WEN = '0' then
		  EMPTY <= '0';
		end if;
	end if;
end process P_EMPTY;

---------------------------------------------------------------------------
-- Process P_FULL indique '1' la FIFO est pleine '0' sinon, cette information
--		 etant mise a jour sur front montant d'horloge
P_FULL:	process(CLK)
	variable next_W : std_logic_vector (ABUS_WIDTH-1 downto 0);
begin
	if rising_edge(CLK) then
		-- test du RST
		if RST='0' then
		  FULL <= '0';
		-- Si on lit pas mais qu'on écrit et que la prochaine adresse du pointeur écriture est au même endroit que celui de lecture, alors FIFO pleine
		elsif WEN = '0' and REN = '1' and W_ADR+1 = R_ADR then
		  FULL <= '1';
		elsif WEN = '1' and REN = '0' then
		  FULL <= '0';
		end if;
	end if;
end process P_FULL;

--------------------------------------------------------------------
-- Process P_MID indique l'etat au moins a moitie plein de la FIFO
--		'1' FIFO au moins a moitie pleine '0' sinon, cette information
--		 etant mise a jour sur front montant d'horloge
P_MID:	process(CLK)
    variable temp_RW : std_logic_vector (ABUS_WIDTH-1 downto 0);
begin
	if rising_edge(CLK) then
		-- test du RST
		if RST='0' then
		  MID <= '0';
		-- Si on écrit mais qu'on lit pas et que le bit de poids fort n'est pas égal entre les deux pointeurs mais les autres bits si, alors MID actif 
		elsif WEN = '0' and REN = '1' then
          temp_RW := W_ADR + conv_std_logic_vector('1',W_ADR'LENGTH);
          if temp_RW(temp_RW'HIGH) /= R_ADR(R_ADR'HIGH) and temp_RW(temp_RW'HIGH-1 downto 0) = R_ADR(R_ADR'HIGH-1 downto 0) then
              MID <= '1';
          end if;
		elsif WEN ='1' and REN = '0' then
          temp_RW := R_ADR + conv_std_logic_vector('1',R_ADR'LENGTH);
          if temp_RW(temp_RW'HIGH) = W_ADR(W_ADR'HIGH) and temp_RW(temp_RW'HIGH-1 downto 0) /= W_ADR(W_ADR'HIGH-1 downto 0) then
              MID <= '0';
          end if;
		end if;
	end if;
end process P_MID;

end behavior;

