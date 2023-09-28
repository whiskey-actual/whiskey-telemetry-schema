CREATE TABLE [dbo].[AzureEnrollmentType] (
    [AzureEnrollmentTypeID]                 INT                 NOT NULL    IDENTITY(1,1),
    [AzureEnrollmentTypeDescription]        VARCHAR(255)        NOT NULL,
    CONSTRIANT [PK_AzureEnrollmentType] PRIMARY KEY CLUSTERED ([AzureEnrollmentTypeID] ASC)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_AzureEnrollmentType_AzureEnrollmentTypeDescription ON AzureEnrollmentType(AzureEnrollmentTypeDescription)
GO

SET IDENTITY_INSERT AzureEnrollmentType ON
INSERT INTO AzureEnrollmentType(AzureEnrollmentTypeID, AzureEnrollmentTypeDescription) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT AzureEnrollmentType OFF
GO

-- add default sproc to get Id
CREATE PROCEDURE sp_get_AzureEnrollmentType
    @AzureEnrollmentTypeDescription VARCHAR(255),
    @AzureEnrollmentTypeID          INT OUTPUT
AS
BEGIN

    SELECT @AzureEnrollmentTypeDescription=LTRIM(RTRIM(AzureEnrollmentTypeDescription))

    IF @AzureEnrollmentTypeDescription IS NULL OR @AzureEnrollmentTypeDescription=''
    BEGIN
        SELECT @AzureEnrollmentTypeDescription='UNKNOWN'
    END

    SELECT @AzureEnrollmentTypeID=AzureEnrollmentTypeID FROM AzureEnrollmentType WITH(NOLOCK) WHERE AzureEnrollmentTypeDescription=@AzureEnrollmentTypeDescription

    IF @AzureEnrollmentTypeID IS NULL
    BEGIN
        INSERT INTO AzureEnrollmentType (AzureEnrollmentTypeDescription) VALUES (@AzureEnrollmentTypeDescription)
        SELECT @AzureEnrollmentTypeID=AzureEnrollmentTypeID FROM AzureEnrollmentType WITH(NOLOCK) WHERE AzureEnrollmentTypeDescription=@AzureEnrollmentTypeDescription
    END    

    RETURN

END