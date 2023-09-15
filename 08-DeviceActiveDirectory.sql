CREATE TABLE [dbo].[DeviceActiveDirectory] (
    [DeviceActiveDirectoryID]			    UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [ActiveDirectoryDN]                     VARCHAR(255)        NOT NULL,
    [ActiveDirectoryOperatingSystemID]      UNIQUEIDENTIFIER    NULL,
    [ActiveDirectoryDNSHostName]            VARCHAR(255)        NULL,
    -- numbers
    [ActiveDirectoryLogonCount]             INT                 NOT NULL DEFAULT(0),
    -- dates
    [ActiveDirectoryWhenCreated]            DATETIME2           NOT NULL,
    [ActiveDirectoryWhenChanged]            DATETIME2           NULL,
    [ActiveDirectoryLastLogon]              DATETIME2           NULL,
    [ActiveDirectoryPwdLastSet]             DATETIME2           NULL,
    [ActiveDirectoryLastLogonTimestamp]     DATETIME2           NULL,
    CONSTRAINT [PK_DeviceActiveDirectoryID] PRIMARY KEY CLUSTERED ([DeviceActiveDirectoryID] ASC),
);
GO

CREATE NONCLUSTERED INDEX IDX_DeviceActiveDirectory_ActiveDirectoryDN ON [dbo].[DeviceActiveDirectory]([ActiveDirectoryDN])
GO

CREATE PROCEDURE dbo.sp_add_activeDirectory_device 
    @deviceName                             VARCHAR(255),
    @activeDirectoryDN                      VARCHAR(255),
    @activeDirectoryOperatingSystem         VARCHAR(255),
    @activeDirectoryOperatingSystemVersion  VARCHAR(255),
    @activeDirectoryDNSHostName             VARCHAR(255),
    @activeDirectoryLogonCount              INT,
    @activeDirectoryWhenCreated             DATETIME2,
    @activeDirectoryWhenChanged             DATETIME2,
    @activeDirectoryLastLogon               DATETIME2,
    @activeDirectoryPwdLastSet              DATETIME2,
    @activeDirectoryLastLogonTimestamp      DATETIME2
AS
BEGIN

    DECLARE @DeviceID UNIQUEIDENTIFIER

    SELECT @DeviceID=DeviceID FROM Device WITH(NOLOCK) WHERE DeviceName=@deviceName
    
    IF @DeviceID IS NULL
    BEGIN
        INSERT INTO Device(DeviceName, DeviceObservedByActiveDirectory) VALUES (@DeviceName, 1)
        SELECT @DeviceID=DeviceID FROM Device WITH(NOLOCK) WHERE DeviceName=@deviceName
    END

    DECLARE @OperatingSystemID UNIQUEIDENTIFIER
    EXEC sp_get_operatingSystemId @activeDirectoryOperatingSystem, @OperatingSystemID=@OperatingSystemID OUTPUT

    DECLARE @DeviceActiveDirectoryID UNIQUEIDENTIFIER
    DECLARE @_ActiveDirectoryOperatingSystemID UNIQUEIDENTIFIER
    SELECT 
        @DeviceActiveDirectoryID=DeviceActiveDirectoryID,
        @_ActiveDirectoryOperatingSystemID=ActiveDirectoryOperatingSystemID
    FROM
        Device WITH(NOLOCK)
    WHERE
        DeviceID=@DeviceID

    IF @DeviceActiveDirectoryID IS NULL
    BEGIN
        INSERT INTO
            DeviceActiveDirectory (
                ActiveDirectoryDN,
                activeDirectoryOperatingSystemID,
                ActiveDirectoryDNSHostName,
                ActiveDirectoryLogonCount,
                ActiveDirectoryWhenCreated,
                activeDirectoryWhenChanged,
                ActiveDirectoryLastLogon,
                ActiveDirectoryPwdLastSet,
                ActiveDirectoryLastLogonTimestamp
            ) VALUES (
                @ActiveDirectoryDN,
                @activeDirectoryOperatingSystemID,
                @ActiveDirectoryDNSHostName,
                @ActiveDirectoryLogonCount,
                @ActiveDirectoryWhenCreated,
                @activeDirectoryWhenChanged,
                @ActiveDirectoryLastLogon,
                @ActiveDirectoryPwdLastSet,
                @ActiveDirectoryLastLogonTimestamp
            )

            SELECT @DeviceActiveDirectoryID=DeviceActiveDirectoryID FROM DeviceActiveDirectory WHERE ActiveDirectoryDN=@ActiveDirectoryDN

            UPDATE Device SET DeviceObservedByActiveDirectory=1, DeviceActiveDirectoryID=@DeviceActiveDirectoryID WHERE DeviceID=@DeviceID

    END
    ELSE
    BEGIN

        UPDATE
            DeviceActiveDirectory
        SET
            ActiveDirectoryDN=@ActiveDirectoryDN,
            activeDirectoryOperatingSystemID=@activeDirectoryOperatingSystemID,
            activeDirectoryOperatingSystemVersion=@activeDirectoryOperatingSystemVersion,
            ActiveDirectoryDNSHostName=@ActiveDirectoryDNSHostName,
            ActiveDirectoryLogonCount=@ActiveDirectoryLogonCount,
            ActiveDirectoryWhenCreated=@ActiveDirectoryWhenCreated,
            activeDirectoryWhenChanged=@activeDirectoryWhenChanged,
            ActiveDirectoryLastLogon=@ActiveDirectoryLastLogon,
            ActiveDirectoryPwdLastSet=@ActiveDirectoryPwdLastSet,
            ActiveDirectoryLastLogonTimestamp=@ActiveDirectoryLastLogonTimestamp
        WHERE
            DeviceActiveDirectoryID=@DeviceActiveDirectoryID
    END



END