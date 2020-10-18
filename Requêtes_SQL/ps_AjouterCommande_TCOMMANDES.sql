USE [RESTAURANT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter PROCEDURE [dbo].[ps_AjouterCommande_TCOMMANDES]
	@idFac as INT,
	@idMe as INT,
	@qt as INT
	
AS
BEGIN
	INSERT INTO TCOMMANDES (IdFacture,IdMenu,Qt) 
	VALUES
		(@idFac ,
		 @idMe,
		 @qt)

	
END