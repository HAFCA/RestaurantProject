USE [RESTAURANT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter PROCEDURE [dbo].[ps_SelectAll_TCOMMANDE_par_idCommande]
	@IdCommande as INT
	
AS
BEGIN
	SELECT
		* 
	from 
		TCOMMANDES 
	where TCOMMANDES.IdCommande= @IdCommande
	
END