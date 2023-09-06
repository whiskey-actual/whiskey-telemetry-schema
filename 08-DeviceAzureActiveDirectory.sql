CREATE TABLE [dbo].[DeviceAzureActiveDirectory] (
    [DeviceAzureActiveDirectoryID]			UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [AzureDisplayName]                      VARCHAR(255)        NOT NULL,
    [AzureId]                               VARCHAR(255)        NOT NULL,
    [AzureDeviceCategory]                   VARCHAR(255)        NOT NULL,
    [AzureDeviceId]                         VARCHAR(255)        NOT NULL,
    [AzureDeviceMetadata]                   VARCHAR(255)        NOT NULL,
    [AzureDeviceOwnership]                  VARCHAR(255)        NOT NULL,
    [AzureDeviceVersion]                    VARCHAR(255)        NOT NULL,
    [AzureDomainName]                       VARCHAR(255)        NOT NULL,
    [AzureEnrollmentProfileType]            VARCHAR(255)        NOT NULL,
    [AzureEnrollmentType]                   VARCHAR(255)        NOT NULL,
    [AzureExternalSourceName]               VARCHAR(255)        NOT NULL,
    [AzureManagementType]                   VARCHAR(255)        NOT NULL,
    [AzureManufacturer]                     VARCHAR(255)        NOT NULL,
    [AzureMDMAppId]                         VARCHAR(255)        NOT NULL,
    [AzureModel]                            VARCHAR(255)        NOT NULL,
    [AzureOnPremisesSyncEnabled]            VARCHAR(255)        NOT NULL,
    [AzureOperatingSystem]                  VARCHAR(255)        NOT NULL,
    [AzureOperatingSystemVersion]           VARCHAR(255)        NOT NULL,
    [AzureProfileType]                      VARCHAR(255)        NOT NULL,
    [AzureSourceType]                       VARCHAR(255)        NOT NULL,
    [AzureTrustType]                        VARCHAR(255)        NOT NULL,
    -- dates
    [AzureDeletedDateTime]                  DATETIME2           NULL,
    [AzureApproximateLastSignInDateTime]    DATETIME2           NULL,
    [AzureComplianceExpirationDateTime]     DATETIME2           NULL,
    [AzureCreatedDateTime]                  DATETIME2           NOT NULL,
    [AzureOnPremisesLastSyncDateTime]       DATETIME2           NULL,
    [AzureRegistrationDateTime]             DATETIME2           NULL,
    -- booleans
    [AzureAccountEnabled]                   BIT                 NOT NULL DEFAULT(0),
    [AzureIsCompliant]                      BIT                 NOT NULL DEFAULT(0),
    [AzureIsManaged]                        BIT                 NOT NULL DEFAULT(0),
    [AzureIsRooted]                         BIT                 NOT NULL DEFAULT(0),
    

    CONSTRAINT [PK_DeviceAzureActiveDirectoryID] PRIMARY KEY CLUSTERED ([DeviceAzureActiveDirectoryID] ASC),
);
GO

