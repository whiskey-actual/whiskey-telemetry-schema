CREATE TABLE [dbo].[DeviceConnectwiseNetwork] (
    [DeviceConnectwiseNetworkID]       	    INT                 NOT NULL    IDENTITY(1,1),
    [ConnectwiseId]                         VARCHAR(255)        NOT NULL,
    [ConnectwiseLocation]                   VARCHAR(255)        NULL, 
    [ConnectwiseLocalIpAddress]             VARCHAR(255)        NULL, 
    [ConnectwiseDeviceType]                 VARCHAR(255)        NULL, 
    [ConnectwiseMacAddress]                 VARCHAR(255)        NULL,
    [ConnectwiseStatus]                     VARCHAR(255)        NULL, 
    [ConnectwiseAlertMessage]               VARCHAR(255)        NULL, 
    [ConnectwiseManufacturerName]           VARCHAR(255)        NULL, 
    [ConnectwiseModelName]                  VARCHAR(255)        NULL, 
    [ConnectwiseDescription]                VARCHAR(255)        NULL, 
    [ConnectwiseClient]                     VARCHAR(255)        NULL, 
    -- dates 
    [ConnectwiseLastUpdated]                DATETIME2           NULL, 
    [ConnectwiseDateAdded]                  DATETIME2           NULL, 
    [ConnectwiseAssetDate]                  DATETIME2           NULL,
    [ConnectwiseLastContact]                 DATETIME2           NULL,
 
    CONSTRAINT [PK_DeviceConnectwiseNetworkID] PRIMARY KEY CLUSTERED ([DeviceConnectwiseNetworkID] ASC),
)
GO

SET IDENTITY_INSERT DeviceConnectwiseNetwork ON
INSERT INTO DeviceConnectwiseNetwork (DeviceConnectwiseNetworkID, ConnectwiseId) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT DeviceConnectwiseNetwork OFF

CREATE NONCLUSTERED INDEX IDX_DeviceConnectwiseNetwork_ConnectwiseId ON [dbo].[DeviceConnectwiseNetwork]([ConnectwiseId])
GO