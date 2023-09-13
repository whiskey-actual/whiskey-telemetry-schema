CREATE TABLE [dbo].[Device] (
    [DeviceID]					            UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [DeviceName]                            VARCHAR(255)        NOT NULL,
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
    [DeviceObservedByAzureManaged]          BIT                 NOT NULL    DEFAULT(0),
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

CREATE NONCLUSTERED INDEX [IDX_Device_DeviceName] ON [dbo].[Device]([DeviceName] ASC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_DeviceIsActive] ON [dbo].[Device]([DeviceISActive] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_ObservedByActiveDirectory] ON [dbo].[Device]([DeviceObservedByActiveDirectory] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_ObservedByAzureActiveDirectory] ON [dbo].[Device]([DeviceObservedByAzureActiveDirectory] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_ObservedByAzureManaged] ON [dbo].[Device]([DeviceObservedByAzureManaged] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_ObservedByConnectwise] ON [dbo].[Device]([DeviceObservedByConnectwise] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_ObservedByCrowdstrike] ON [dbo].[Device]([DeviceObservedByCrowdstrike] DESC);
GO