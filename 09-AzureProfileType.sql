CREATE TABLE [dbo].[AzureProfileType] (
    [AzureProfileTypeID]                 INT                 NOT NULL    IDENTITY(1,1),
    [AzureProfileTypeDescription]        VARCHAR(255)        NOT NULL,
    CONSTRIANT [PK_AzureProfileType] PRIMARY KEY CLUSTERED ([AzureProfileTypeID] ASC)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_AzureProfileType_AzureProfileTypeDescription ON AzureProfileType(AzureProfileTypeDescription)
GO

SET IDENTITY_INSERT AzureProfileType ON
INSERT INTO AzureProfileType(AzureProfileTypeID, AzureProfileTypeDescription) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT AzureProfileType OFF
GO

-- add default sproc to get Id
CREATE PROCEDURE sp_get_AzureProfileType
    @AzureProfileTypeDescription VARCHAR(255),
    @AzureProfileTypeID          INT OUTPUT
AS
BEGIN

    SELECT @AzureProfileTypeDescription=LTRIM(RTRIM(AzureProfileTypeDescription))

    IF @AzureProfileTypeDescription IS NULL OR @AzureProfileTypeDescription=''
    BEGIN
        SELECT @AzureProfileTypeDescription='UNKNOWN'
    END

    SELECT @AzureProfileTypeID=AzureProfileTypeID FROM AzureProfileType WITH(NOLOCK) WHERE AzureProfileTypeDescription=@AzureProfileTypeDescription

    IF @AzureProfileTypeID IS NULL
    BEGIN
        INSERT INTO AzureProfileType (AzureProfileTypeDescription) VALUES (@AzureProfileTypeDescription)
        SELECT @AzureProfileTypeID=AzureProfileTypeID FROM AzureProfileType WITH(NOLOCK) WHERE AzureProfileTypeDescription=@AzureProfileTypeDescription
    END    

    RETURN

END