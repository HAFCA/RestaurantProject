USE [RESTAURANT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ps_SelectAllCommande_TCOMMANDES]
	
AS
BEGIN
	SELECT
		*

	FROM
		TCOMMANDES
	
END
