CREATE TABLE [dbo].[HardwareModel] (
    [HardwareModelID]                 INT                 NOT NULL    IDENTITY(1,1),
    [HardwareModelDescription]        VARCHAR(255)        NOT NULL,
    CONSTRIANT [PK_HardwareModel] PRIMARY KEY CLUSTERED ([HardwareModelID] ASC)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_HardwareModel_HardwareModelDescription ON HardwareModel(HardwareModelDescription)
GO

SET IDENTITY_INSERT HardwareModel ON
INSERT INTO HardwareModel(HardwareModelID, HardwareModelDescription) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT HardwareModel OFF
GO

-- add default sproc to get Id
CREATE PROCEDURE sp_get_HardwareModel
    @HardwareModelDescription VARCHAR(255),
    @HardwareModelID          INT OUTPUT
AS
BEGIN

    SELECT @HardwareModelDescription=LTRIM(RTRIM(HardwareModelDescription))

    IF @HardwareModelDescription IS NULL OR @HardwareModelDescription=''
    BEGIN
        SELECT @HardwareModelDescription='UNKNOWN'
    END

    SELECT @HardwareModelID=HardwareModelID FROM HardwareModel WITH(NOLOCK) WHERE HardwareModelDescription=@HardwareModelDescription

    IF @HardwareModelID IS NULL
    BEGIN
        INSERT INTO HardwareModel (HardwareModelDescription) VALUES (@HardwareModelDescription)
        SELECT @HardwareModelID=HardwareModelID FROM HardwareModel WITH(NOLOCK) WHERE HardwareModelDescription=@HardwareModelDescription
    END    

    RETURN

END