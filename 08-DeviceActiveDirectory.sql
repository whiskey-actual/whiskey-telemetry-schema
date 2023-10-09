-- create table
CREATE TABLE [dbo].[DeviceActiveDirectory] (
    [DeviceActiveDirectoryID]			        INT                 NOT NULL    IDENTITY(1,1),
    [ActiveDirectoryDN]                         VARCHAR(255)        NOT NULL,
    [ActiveDirectoryDNSHostName]                VARCHAR(255)        NULL,
    -- numbers
    [ActiveDirectoryLogonCount]                 INT                 NOT NULL    DEFAULT((0)),
    [ActiveDirectoryOperatingSystemVersionID]   INT                 NOT NULL    DEFAULT((0)),
    [ActiveDirectoryOperatingSystemVariantID]   INT                 NOT NULL    DEFAULT((0)),
    -- dates
    [ActiveDirectoryWhenCreated]                DATETIME2           NULL,
    [ActiveDirectoryWhenChanged]                DATETIME2           NULL,
    [ActiveDirectoryLastLogon]                  DATETIME2           NULL,
    [ActiveDirectoryPwdLastSet]                 DATETIME2           NULL,
    [ActiveDirectoryLastLogonTimestamp]         DATETIME2           NULL,
    [ActiveDirectoryLastSeen]                   DATETIME2           NULL,
    CONSTRAINT [PK_DeviceActiveDirectoryID] PRIMARY KEY CLUSTERED ([DeviceActiveDirectoryID] ASC),
    CONSTRAINT [FK_DeviceActiveDirectory_OperatingSystemVersion] FOREIGN KEY (ActiveDirectoryOperatingSystemVersionID) REFERENCES OperatingSystemVersion(OperatingSystemVersionID),
    CONSTRAINT [FK_DeviceActiveDirectory_OperatingSystemVariant] FOREIGN KEY (ActiveDirectoryOperatingSystemVariantID) REFERENCES OperatingSystemVariant(OperatingSystemVariantID),
);
GO

-- add default 0 row
SET IDENTITY_INSERT DeviceActiveDirectory ON
INSERT INTO DeviceActiveDirectory(DeviceActiveDirectoryID, ActiveDirectoryDN) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT DeviceActiveDirectory OFF

-- indexes
CREATE NONCLUSTERED INDEX IDX_DeviceActiveDirectory_ActiveDirectoryDN ON [dbo].[DeviceActiveDirectory]([ActiveDirectoryDN])
GO
