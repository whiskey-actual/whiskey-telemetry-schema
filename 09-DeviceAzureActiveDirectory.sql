

CREATE TABLE [dbo].[DeviceAzureActiveDirectory] (
    [DeviceAzureActiveDirectoryID]			INT                 NOT NULL    IDENTITY(1,1),
    [AzureDeviceId]                         VARCHAR(255)        NOT NULL,
    [AzureId]                               VARCHAR(255)        NULL,
    [AzureDeviceCategory]                   VARCHAR(255)        NULL,
    [AzureDeviceMetadata]                   VARCHAR(255)        NULL, -- always null
    [AzureDeviceOwnership]                  VARCHAR(255)        NULL,
    [AzureDeviceVersion]                    VARCHAR(255)        NULL,
    [AzureDomainName]                       VARCHAR(255)        NULL, -- always null
    [AzureEnrollmentProfileType]            VARCHAR(255)        NULL, -- always null
    [AzureEnrollmentType]                   VARCHAR(255)        NULL,
    [AzureExternalSourceName]               VARCHAR(255)        NULL, -- always null
    [AzureManagementType]                   VARCHAR(255)        NULL,
    [AzureManufacturer]                     VARCHAR(255)        NULL,
    [AzureMDMAppId]                         VARCHAR(255)        NULL,
    [AzureModel]                            VARCHAR(255)        NULL,
    [AzureProfileType]                      VARCHAR(255)        NULL,
    [AzureSourceType]                       VARCHAR(255)        NULL, -- always null
    [AzureTrustType]                        VARCHAR(255)        NULL,
    -- int
    [AzureOperatingSystemXRefID]            INT                 NOT NULL    DEFAULT((0)),
    -- dates
    [AzureDeletedDateTime]                  DATETIME2           NULL,
    [AzureApproximateLastSignInDateTime]    DATETIME2           NULL,
    [AzureComplianceExpirationDateTime]     DATETIME2           NULL,
    [AzureCreatedDateTime]                  DATETIME2           NULL,
    [AzureOnPremisesLastSyncDateTime]       DATETIME2           NULL,
    [AzureRegistrationDateTime]             DATETIME2           NULL,
    -- booleans
    [AzureOnPremisesSyncEnabled]            BIT                 NOT NULL DEFAULT((0)),
    [AzureAccountEnabled]                   BIT                 NOT NULL DEFAULT((0)),
    [AzureIsCompliant]                      BIT                 NOT NULL DEFAULT((0)),
    [AzureIsManaged]                        BIT                 NOT NULL DEFAULT((0)),
    [AzureIsRooted]                         BIT                 NOT NULL DEFAULT((0)),
    
    CONSTRAINT [PK_DeviceAzureActiveDirectoryID] PRIMARY KEY CLUSTERED ([DeviceAzureActiveDirectoryID] ASC),
    CONSTRAINT FK_DeviceAzureActiveDirectory_OperatingSystemXRef FOREIGN KEY (AzureOperatingSystemXRefID) REFERENCES OperatingSystemXRef(OperatingSystemXRefID)
);
GO

SET IDENTITY_INSERT DeviceAzureActiveDirectory ON
INSERT INTO DeviceAzureActiveDirectory (DeviceAzureActiveDirectoryID, AzureDeviceId) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT DeviceAzureActiveDirectory OFF


CREATE UNIQUE NONCLUSTERED INDEX IDX_DeviceAzureActiveDirectory_AzureDeviceID ON [dbo].[DeviceAzureActiveDirectory]([AzureDeviceId])
GO

