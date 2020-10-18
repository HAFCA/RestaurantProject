USE [RESTAURANT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ps_Modifier_Menu_TMENU]
	@menu as nvarchar(50),
	@desc as nvarchar(200),
	@IdMenu as INT
	
AS
BEGIN
	UPDATE TMENUS 
	SET 
		Menu = @menu,
		Description = @desc
	Where IdMenu = @IdMenu

	
END