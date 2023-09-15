CREATE TABLE [dbo].[OperatingSystem] (
    [OperatingSystemID]			            UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [OperatingSystemDescription]            VARCHAR(255)        NOT NULL,
    [OperatingSystemNormalizedID]           UNIQUEIDENTIFIER    NULL,
    CONSTRAINT [PK_OperatingSystem] PRIMARY KEY CLUSTERED ([OperatingSystemID] ASC),
);
GO

CREATE NONCLUSTERED INDEX IDX_OperatingSystem_OperatingSystemDescription ON OperatingSystem(OperatingSystemDescription);
GO


CREATE PROCEDURE sp_get_operatingSystemId
    @OperatingSystemDescription VARCHAR(255),
    @OperatingSystemID          UNIQUEIDENTIFIER OUTPUT
AS
BEGIN

    DECLARE @OperatingSystemNormalizedID UNIQUEIDENTIFIER

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