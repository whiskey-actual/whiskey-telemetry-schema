CREATE TABLE [dbo].[DeviceConnectwise] (
    [DeviceConnectwiseID]       			UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [ConnectwiseId]                         VARCHAR(255)        NOT NULL,
    [ConnectwiseLocation]                   VARCHAR(255)        NOT NULL,
    [ConnectwiseClient]                     VARCHAR(255)        NOT NULL,
    [ConnectwiseOperatingSystem]            VARCHAR(255)        NOT NULL,
    [ConnectwiseOperatingSystemVersion]     VARCHAR(255)        NOT NULL,
    [ConnectwiseDomainName]                 VARCHAR(255)        NOT NULL,
    [ConnectwiseAgentVersion]               VARCHAR(255)        NOT NULL,
    [ConnectwiseComment]                    VARCHAR(255)        NOT NULL,
    [ConnectwiseIpAddress]                  VARCHAR(255)        NOT NULL,
    [ConnectwiseMacAddress]                 VARCHAR(255)        NOT NULL,
    [ConnectwiseLastUserName]               VARCHAR(255)        NOT NULL,
    [ConnectwiseType]                       VARCHAR(255)        NOT NULL,
    [ConnectwiseStatus]                     VARCHAR(255)        NOT NULL,
    [ConnectwiseSerialNumber]               VARCHAR(255)        NOT NULL,
    [ConnectwiseBiosManufacturer]           VARCHAR(255)        NOT NULL,
    [ConnectwiseModel]                      VARCHAR(255)        NOT NULL,
    [ConnectwiseDescription]                VARCHAR(255)        NOT NULL,
    -- numbers  
    [ConnectwiseTotalMemory]                VARCHAR(255)        NOT NULL,
    [ConnectwiseFreeMemory]                 VARCHAR(255)        NOT NULL,
    -- dates 
    [ConnectwiseLastObserved]               DATETIME2           NOT NULL,
    [ConnectwiseFirstSeen]                  DATETIME2           NOT NULL,
    [ConnectwiseWindowsUpdateDate]          DATETIME2           NULL,
    [ConnectwiseAntivirusDefinitionDate]    DATETIME2           NULL,
 
    CONSTRAINT [PK_DeviceConnectwiseID] PRIMARY KEY CLUSTERED ([DeviceConnectwiseID] ASC),
)
GO

