USE [RESTAURANT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter PROCEDURE [dbo].[ps_chercher_TCOMMANDES_par_menu]
	@rechercher	AS nvarchar(50)
AS
BEGIN
	SELECT
		IdCommande,
		TMENUS.IdMenu,
		IdFacture,
		Menu,
		Qt

	FROM
		TCOMMANDES
		INNER JOIN TMENUS ON TCOMMANDES.IdMenu = TMENUS.IdMenu
	WHERE	
		Menu = @rechercher	
END
