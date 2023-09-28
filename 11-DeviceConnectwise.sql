CREATE TABLE [dbo].[DeviceConnectwise] (
    [DeviceConnectwiseID]       	        INT                 NOT NULL    IDENTITY(1,1),
    [ConnectwiseId]                         VARCHAR(255)        NOT NULL,
    
    [ConnectwiseDeviceType]                 VARCHAR(255)        NULL, 
    [ConnectwiseLocation]                   VARCHAR(255)        NULL, 
    [ConnectwiseClient]                     VARCHAR(255)        NULL, 
    [ConnectwiseOperatingSystem]            VARCHAR(255)        NULL, 
    [ConnectwiseOperatingSystemVersion]     VARCHAR(255)        NULL, 
    [ConnectwiseDomainName]                 VARCHAR(255)        NULL, 
    [ConnectwiseAgentVersion]               VARCHAR(255)        NULL, 
    [ConnectwiseComment]                    VARCHAR(255)        NULL, 
    [ConnectwiseIpAddress]                  VARCHAR(255)        NULL, 
    [ConnectwiseMacAddress]                 VARCHAR(255)        NULL,
    [ConnectwiseLastUserName]               VARCHAR(255)        NULL, 
    [ConnectwiseStatus]                     VARCHAR(255)        NULL, 
    [ConnectwiseSerialNumber]               VARCHAR(255)        NULL, 
    [ConnectwiseBiosManufacturer]           VARCHAR(255)        NULL, 
    [ConnectwiseModel]                      VARCHAR(255)        NULL, 
    [ConnectwiseDescription]                VARCHAR(255)        NULL, 
    -- numbers  
    [ConnectwiseTotalMemory]                BIGINT              NULL, 
    [ConnectwiseFreeMemory]                 BIGINT              NULL, 
    -- dates 
    [ConnectwiseFirstSeen]                  DATETIME2           NULL, 
    [ConnectwiseLastObserved]               DATETIME2           NULL, 
    [ConnectwiseWindowsUpdateDate]          DATETIME2           NULL,
    [ConnectwiseAntivirusDefinitionDate]    DATETIME2           NULL,
    [ConnectwiseAssetDate]                  DATETIME2           NULL,
 
    CONSTRAINT [PK_DeviceConnectwiseID] PRIMARY KEY CLUSTERED ([DeviceConnectwiseID] ASC),
)
GO

SET IDENTITY_INSERT DeviceConnectwise ON
INSERT INTO DeviceConnectwise (DeviceConnectwiseID, ConnectwiseId) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT DeviceConnectwise OFF

CREATE NONCLUSTERED INDEX IDX_DeviceConnectwise_ConnectwiseId ON [dbo].[DeviceConnectwise]([ConnectwiseId])
GO