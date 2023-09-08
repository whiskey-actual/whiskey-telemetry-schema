CREATE TABLE [dbo].[Device] (
    [DeviceID]					            UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [DeviceIsActive]                        BIT                 NOT NULL    DEFAULT(0),
    [DeviceFirstObserved]                   DATETIME2           NOT NULL    DEFAULT(SYSDATETIME()),
    [DeviceLastObserved]                    DATETIME2           NOT NULL    DEFAULT(SYSDATETIME()),

    -- AD
    [DeviceObservedByActiveDirectory]       BIT                 NOT NULL    DEFAULT(0),
    [DeviceActiveDirectoryID]               UNIQUEIDENTIFIER    NULL,

    -- AAD
    [DeviceObservedByAzureActiveDirectory]  BIT                 NOT NULL    DEFAULT(0),
    [DeviceAzureActiveDirectoryID]          UNIQUEIDENTIFIER    NULL,

    -- Azure MDM
    [DeviceObservedByAzureManagement]       BIT                 NOT NULL    DEFAULT(0),
    [DeviceAzureManagedID]                  UNIQUEIDENTIFIER    NULL,

    -- Connectwise
    [DeviceObservedByConnectwise]           BIT                 NOT NULL    DEFAULT(0),
    [DeviceConnectwiseID]                   UNIQUEIDENTIFIER    NULL,

    -- Crowdstrike
    [DeviceObservedByCrowdstrike]           BIT                 NOT NULL    DEFAULT(0),
    [DeviceCrowdstrikeID]                   UNIQUEIDENTIFIER    NULL,

    -- keys
    CONSTRAINT [PK_DeviceID] PRIMARY KEY CLUSTERED ([DeviceID] ASC),
    CONSTRAINT [FK_Device_DeviceActiveDirectory] FOREIGN KEY (DeviceActiveDirectoryID) REFERENCES [dbo].[DeviceActiveDirectory](DeviceActiveDirectoryID),
    CONSTRAINT [FK_Device_DeviceAzureActiveDirectory] FOREIGN KEY (DeviceAzureActiveDirectoryID) REFERENCES [dbo].[DeviceAzureActiveDirectory](DeviceAzureActiveDirectoryID),
    CONSTRAINT [FK_Device_DeviceConnectwise] FOREIGN KEY (DeviceConnectwiseID) REFERENCES [dbo].[DeviceConnectwise](DeviceConnectwiseID),
    CONSTRAINT [FK_Device_DeviceCrowdstrike] FOREIGN KEY (DeviceCrowdstrikeID) REFERENCES [dbo].[DeviceCrowdstrike](DeviceCrowdstrikeID)
);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_DeviceIsActive] ON [dbo].[Device]([DeviceISActive] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_ObservedByActiveDirectory] ON [dbo].[Device]([DeviceObservedByActiveDirectory] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_ObservedByAzureActiveDirectory] ON [dbo].[Device]([DeviceObservedByAzureActiveDirectory] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_ObservedByConnectwise] ON [dbo].[Device]([DeviceObservedByConnectwise] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_ObservedByCrowdstrike] ON [dbo].[Device]([DeviceObservedByCrowdstrike] DESC);
GO

CREATE PROCEDURE dbo.sp_add_device_activeDirectory 
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

    DECLARE @DeviceID INT
    SELECT @DeviceID=0

    SELECT @DeviceID=DeviceID FROM Device WHERE DeviceName=@deviceName
    
    IF(@DeviceID=0)
    BEGIN
        INSERT INTO Device(DeviceName, DeviceObservedByActiveDirectory) VALUES (@DeviceName, 1)
        SELECT @DeviceID=DeviceID FROM Device WHERE DeviceName=@deviceName
    END

    DECLARE @DeviceActiveDirectoryID INT
    SELECT @DeviceActiveDirectoryID=0
    SELECT @DeviceActiveDirectoryID=DeviceActiveDirectoryID FROM DeviceActiveDirectory WHERE DeviceID=@DeviceID

    IF @DeviceActiveDirectoryID=0
    BEGIN
        INSERT INTO
            DeviceActiveDirectory (
                ActiveDirectoryDN,
                activeDirectoryOperatingSystem,
                activeDirectoryOperatingSystemVersion,
                ActiveDirectoryDNSHostName,
                ActiveDirectoryLogonCount,
                ActiveDirectoryWhenCreated,
                activeDirectoryWhenChanged,
                ActiveDirectoryLastLogon,
                ActiveDirectoryPwdLastSet,
                ActiveDirectoryLastLogonTimestamp
            ) VALUES (
                @ActiveDirectoryDN,
                @activeDirectoryOperatingSystem,
                @activeDirectoryOperatingSystemVersion,
                @ActiveDirectoryDNSHostName,
                @ActiveDirectoryLogonCount,
                @ActiveDirectoryWhenCreated,
                @activeDirectoryWhenChanged,
                @ActiveDirectoryLastLogon,
                @ActiveDirectoryPwdLastSet,
                @ActiveDirectoryLastLogonTimestamp
            )
    END
    ELSE
    BEGIN
        UPDATE
            DeviceActiveDirectory
        SET
            ActiveDirectoryDN=@ActiveDirectoryDN,
            activeDirectoryOperatingSystem=@activeDirectoryOperatingSystem,
            activeDirectoryOperatingSystemVersion=@activeDirectoryOperatingSystemVersion,
            ActiveDirectoryDNSHostName=@ActiveDirectoryDNSHostName,
            ActiveDirectoryLogonCount=@ActiveDirectoryLogonCount,
            ActiveDirectoryWhenCreated=@ActiveDirectoryWhenCreated,
            activeDirectoryWhenChanged=@activeDirectoryWhenChanged,
            ActiveDirectoryLastLogon=@ActiveDirectoryLastLogon,
            ActiveDirectoryPwdLastSet=@ActiveDirectoryPwdLastSet,
            ActiveDirectoryLastLogonTimestamp=@ActiveDirectoryLastLogonTimestamp
    END



END