CREATE TABLE [dbo].[AzureTrustType] (
    [AzureTrustTypeID]                 INT                 NOT NULL    IDENTITY(1,1),
    [AzureTrustTypeDescription]        VARCHAR(255)        NOT NULL,
    CONSTRIANT [PK_AzureTrustType] PRIMARY KEY CLUSTERED ([AzureTrustTypeID] ASC)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_AzureTrustType_AzureTrustTypeDescription ON AzureTrustType(AzureTrustTypeDescription)
GO

SET IDENTITY_INSERT AzureTrustType ON
INSERT INTO AzureTrustType(AzureTrustTypeID, AzureTrustTypeDescription) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT AzureTrustType OFF
GO

-- add default sproc to get Id
CREATE PROCEDURE sp_get_AzureTrustType
    @AzureTrustTypeDescription VARCHAR(255),
    @AzureTrustTypeID          INT OUTPUT
AS
BEGIN

    SELECT @AzureTrustTypeDescription=LTRIM(RTRIM(AzureTrustTypeDescription))

    IF @AzureTrustTypeDescription IS NULL OR @AzureTrustTypeDescription=''
    BEGIN
        SELECT @AzureTrustTypeDescription='UNKNOWN'
    END

    SELECT @AzureTrustTypeID=AzureTrustTypeID FROM AzureTrustType WITH(NOLOCK) WHERE AzureTrustTypeDescription=@AzureTrustTypeDescription

    IF @AzureTrustTypeID IS NULL
    BEGIN
        INSERT INTO AzureTrustType (AzureTrustTypeDescription) VALUES (@AzureTrustTypeDescription)
        SELECT @AzureTrustTypeID=AzureTrustTypeID FROM AzureTrustType WITH(NOLOCK) WHERE AzureTrustTypeDescription=@AzureTrustTypeDescription
    END    

    RETURN

END