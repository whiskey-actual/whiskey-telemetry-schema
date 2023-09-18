-- create table
CREATE TABLE [dbo].[OperatingSystem] (
    [OperatingSystemID]			            INT                 NOT NULL    IDENTITY(1,1),
    [OperatingSystemDescription]            VARCHAR(255)        NOT NULL,
    [OperatingSystemNormalizedID]           INT                 NULL,
    CONSTRAINT [PK_OperatingSystem] PRIMARY KEY CLUSTERED ([OperatingSystemID] ASC),
);
GO

-- add default/unknown row with ID 0
SET IDENTITY_INSERT OperatingSystem ON;
INSERT INTO OperatingSystem (OperatingSystemID, OperatingSystemDescription) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT OperatingSystem OFF;

-- add index(es)
CREATE UNIQUE NONCLUSTERED INDEX IDX_OperatingSystem_OperatingSystemDescription ON OperatingSystem(OperatingSystemDescription);
GO

-- add default sproc to get Id
CREATE PROCEDURE sp_get_operatingSystemId
    @OperatingSystemDescription VARCHAR(255),
    @OperatingSystemID          INT OUTPUT
AS
BEGIN

    IF @OperatingSystemDescription IS NULL
    BEGIN
        SELECT @OperatingSystemDescription='UNKNOWN'
    END
    ELSE
    BEGIN
        SELECT @OperatingSystemDescription=LTRIM(RTRIM(@OperatingSystemDescription))
    END

    DECLARE @OperatingSystemNormalizedID INT

    SELECT 
        @OperatingSystemID=OperatingSystemID, 
        @OperatingSystemNormalizedID=OperatingSystemNormalizedID 
    FROM
        OperatingSystem WITH(NOLOCK)
    WHERE 
        OperatingSystemDescription=@OperatingSystemDescription

    IF @OperatingSystemID IS NULL
    BEGIN
        INSERT INTO OperatingSystem (OperatingSystemDescription) VALUES (@OperatingSystemDescription)
        SELECT @OperatingSystemID=OperatingSystemID FROM OperatingSystem WITH(NOLOCK) WHERE OperatingSystemDescription=@OperatingSystemDescription
    END
    ELSE
    BEGIN
        IF @OperatingSystemNormalizedID IS NOT NULL
        BEGIN
            SELECT @OperatingSystemID=@OperatingSystemNormalizedID
        END
    END
    

    RETURN

END