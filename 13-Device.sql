CREATE TABLE [dbo].[Device] (
    [DeviceID]					            UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [DeviceName]                            VARCHAR(255)        NOT NULL,
    [DeviceIsActive]                        BIT                 NOT NULL    DEFAULT(0),
    [DeviceFirstObserved]                   DATETIME2           NOT NULL    DEFAULT(SYSDATETIME()),
    [DeviceLastObserved]                    DATETIME2           NOT NULL    DEFAULT(SYSDATETIME()),

    -- AD
    [DeviceActiveDirectoryID]               INT                 NOT NULL    DEFAULT(0),

    -- AAD
    [DeviceAzureActiveDirectoryID]          INT                 NOT NULL    DEFAULT(0),

    -- Azure MDM
    [DeviceAzureManagedID]                  INT                 NOT NULL    DEFAULT(0),

    -- Connectwise
    [DeviceConnectwiseID]                   INT                 NOT NULL    DEFAULT(0),

    -- Crowdstrike
    [DeviceCrowdstrikeID]                   INT                 NOT NULL    DEFAULT(0),

    -- keys
    CONSTRAINT [PK_DeviceID] PRIMARY KEY CLUSTERED ([DeviceID] ASC),
    CONSTRAINT [FK_Device_DeviceActiveDirectory] FOREIGN KEY (DeviceActiveDirectoryID) REFERENCES [dbo].[DeviceActiveDirectory](DeviceActiveDirectoryID),
    CONSTRAINT [FK_Device_DeviceAzureActiveDirectory] FOREIGN KEY (DeviceAzureActiveDirectoryID) REFERENCES [dbo].[DeviceAzureActiveDirectory](DeviceAzureActiveDirectoryID),
    CONSTRAINT [FK_Device_DeviceAzureManaged] FOREIGN KEY (DeviceAzureManagedID) REFERENCES [dbo].[DeviceAzureManaged](DeviceAzureManagedID),
    CONSTRAINT [FK_Device_DeviceConnectwise] FOREIGN KEY (DeviceConnectwiseID) REFERENCES [dbo].[DeviceConnectwise](DeviceConnectwiseID),
    CONSTRAINT [FK_Device_DeviceCrowdstrike] FOREIGN KEY (DeviceCrowdstrikeID) REFERENCES [dbo].[DeviceCrowdstrike](DeviceCrowdstrikeID)
);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_DeviceName] ON [dbo].[Device]([DeviceName] ASC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_DeviceIsActive] ON [dbo].[Device]([DeviceISActive] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_DeviceActiveDirectoryID] ON [dbo].[Device]([DeviceActiveDirectoryID] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_DeviceAzureActiveDirectoryID] ON [dbo].[Device]([DeviceAzureActiveDirectoryID] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_DeviceAzureManagedID] ON [dbo].[Device]([DeviceAzureManagedID] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_DeviceConnectwiseID] ON [dbo].[Device]([DeviceConnectwiseID] DESC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_DeviceCrowdstrikeID] ON [dbo].[Device]([DeviceCrowdstrikeID] DESC);
GO