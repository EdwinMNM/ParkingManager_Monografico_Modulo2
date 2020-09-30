USE [DB_ESTACIONAMIENTO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pa_buscarTurno]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pa_buscarTurno] AS' 
END
GO
ALTER PROCEDURE [dbo].[pa_buscarTurno]  
    @idTurno int = null,
	@FechaDesde datetime = null, 
	@FechaHasta datetime = null,
	@EstaAbierto bit = null	
AS  
BEGIN  
    SELECT IdTurno  
		,TURNO.IdEmpleado
	    ,EMPLEADO.Nombre AS NombreEmpleado
		,ISNULL(FechaApertura,'') AS FechaApertura 
		,ISNULL(FechaCierre,'') AS FechaCierre 
		,ISNULL(MontoApertura,0.00) AS MontoApertura
		,ISNULL(MontoCobrado,0.00) AS MontoCobrado  
		,ISNULL(MontoEntregado,0.00) AS MontoEntregado   
		,ISNULL(MontoDiferencia,0.00) AS MontoDiferencia
		,TURNO.EstaAbierto
 FROM TURNO
 JOIN EMPLEADO
	ON EMPLEADO.IdEmpleado = TURNO.IdEmpleado
 WHERE (@idTurno is null or IdTurno = @idTurno) AND
		(@FechaDesde is null or TURNO.FechaApertura between @FechaDesde AND @FechaHasta) AND
		(@EstaAbierto is null OR TURNO.EstaAbierto = @EstaAbierto)
END
GO
