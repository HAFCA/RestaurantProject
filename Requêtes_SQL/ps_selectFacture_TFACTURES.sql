USE [RESTAURANT]
GO
/****** Object:  StoredProcedure [dbo].[ps_selectFacture_TFACTURES]    Script Date: 16/09/2020 17:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ps_selectFacture_TFACTURES]
	
AS
BEGIN
	SELECT
		IdFacture,
		IdClient
		
	FROM
		TFACTURES
	
END
