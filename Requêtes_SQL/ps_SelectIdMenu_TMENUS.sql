USE [RESTAURANT]
GO
/****** Object:  StoredProcedure [dbo].[ps_SelectIdMenu_TMENUS]    Script Date: 16/09/2020 17:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ps_SelectIdMenu_TMENUS]
	
AS
BEGIN
	SELECT
		IdMenu
		
	FROM
		TMENUS
	
END