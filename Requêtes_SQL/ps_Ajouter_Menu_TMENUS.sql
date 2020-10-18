USE [RESTAURANT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ps_Ajouter_Menu_TMENUS]
	@menu as nvarchar(50),
	@desc as nvarchar(200)
	
AS
BEGIN
	INSERT INTO TMENUS (Menu,Description)
	
	VALUES 
		(@menu ,@desc)

	
END