CREATE TABLE [dbo].[DeviceActiveDirectory] (
    [DeviceActiveDirectoryID]			    UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [ActiveDirectoryDN]                     VARCHAR(255)        NULL,
    [ActiveDirectoryOperatingSystem]        VARCHAR(255)        NULL,
    [ActiveDirectoryOperatingSystemVersion] VARCHAR(255)        NULL,
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

