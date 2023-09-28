CREATE TABLE [dbo].[Company] (
    [CompanyID]                 INT                 NOT NULL    IDENTITY(1,1),
    [CompanyName]        VARCHAR(255)        NOT NULL,
    CONSTRIANT [PK_Company] PRIMARY KEY CLUSTERED ([CompanyID] ASC)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_Company_CompanyName ON Company(CompanyName)
GO

SET IDENTITY_INSERT Company ON
INSERT INTO Company(CompanyID, CompanyName) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT Company OFF
GO

-- add default sproc to get Id
CREATE PROCEDURE sp_get_Company
    @CompanyName VARCHAR(255),
    @CompanyID          INT OUTPUT
AS
BEGIN

    SELECT @CompanyName=LTRIM(RTRIM(CompanyName))

    IF @CompanyName IS NULL OR @CompanyName=''
    BEGIN
        SELECT @CompanyName='UNKNOWN'
    END

    SELECT @CompanyID=CompanyID FROM Company WITH(NOLOCK) WHERE CompanyName=@CompanyName

    IF @CompanyID IS NULL
    BEGIN
        INSERT INTO Company (CompanyName) VALUES (@CompanyName)
        SELECT @CompanyID=CompanyID FROM Company WITH(NOLOCK) WHERE CompanyName=@CompanyName
    END    

    RETURN

END