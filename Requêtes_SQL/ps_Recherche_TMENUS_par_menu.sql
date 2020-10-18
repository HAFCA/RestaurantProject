USE [RESTAURANT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ps_Recherche_TMENUS_par_menu]
	@menu as nvarchar(50)
	
AS
BEGIN
	SELECT 
		IdMenu, Menu, Description 
	FROM 
		TMENUS 
	WHERE Menu LIKE @menu

	
END