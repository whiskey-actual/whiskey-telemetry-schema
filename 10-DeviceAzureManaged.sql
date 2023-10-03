CREATE TABLE [dbo].[DeviceAzureManaged] (
    [DeviceAzureManagedID]      			                INT                 NOT NULL    IDENTITY(1,1),
    [AzureManagedId]                                        VARCHAR(255)        NOT NULL,
    [AzureManagedDeviceName]                                VARCHAR(255)        NULL,
    [AzureManagedUserId]                                    VARCHAR(255)        NULL,
    [AzureManagedDeviceOwnerType]                           VARCHAR(255)        NULL,
    [AzureManagedOperatingSystem]                           VARCHAR(255)        NULL,
    [AzureManagedComplianceState]                           VARCHAR(255)        NULL,
    [AzureManagedJailBroken]                                VARCHAR(255)        NULL,
    [AzureManagedManagementAgent]                           VARCHAR(255)        NULL,
    [AzureManagedOperatingSystemVersion]                    VARCHAR(255)        NULL,
    [AzureManagedEASDeviceID]                               VARCHAR(255)        NULL,
    [AzureManagedDeviceEnrollmentType]                      VARCHAR(255)        NULL,
    [AzureManagedActivationLockBypassCode]                  VARCHAR(255)        NULL,
    [AzureManagedEmailAddress]                              VARCHAR(255)        NULL,
    [AzureManagedAzureADDeviceID]                           VARCHAR(255)        NULL,
    [AzureManagedDeviceRegistrationState]                   VARCHAR(255)        NULL,
    [AzureManagedDeviceCategoryDisplayName]                 VARCHAR(255)        NULL,
    [AzureManagedExchangeAccessState]                       VARCHAR(255)        NULL,
    [AzureManagedExchangeAccessStateReason]                 VARCHAR(255)        NULL,
    [AzureManagedRemoteAssistanceSessionUrl]                VARCHAR(255)        NULL,
    [AzureManagedRemoteAssistanceErrorDetails]              VARCHAR(255)        NULL,
    [AzureManagedUserPrincipalName]                         VARCHAR(255)        NULL,
    [AzureManagedModel]                                     VARCHAR(255)        NULL,
    [AzureManagedManufacturer]                              VARCHAR(255)        NULL,
    [AzureManagedIMEI]                                      VARCHAR(255)        NULL,
    [AzureManagedSerialNumber]                              VARCHAR(255)        NULL,
    [AzureManagedPhoneNumber]                               VARCHAR(255)        NULL,
    [AzureManagedAndroidSecurityPatchLevel]                 VARCHAR(255)        NULL,
    [AzureManagedUserDisplayName]                           VARCHAR(255)        NULL,
    [AzureManagedConfigurationManagerClientEnabledFeatures] VARCHAR(255)        NULL,
    [AzureManagedWiFiMACAddress]                            VARCHAR(255)        NULL,
    [AzureManagedDeviceHealthAttestationState]              VARCHAR(255)        NULL,
    [AzureManagedSubscriberCarrier]                         VARCHAR(255)        NULL,
    [AzureManagedMEID]                                      VARCHAR(255)        NULL,
    [AzureManagedPartnerReportedThreatState]                VARCHAR(255)        NULL,
    [AzureManagedRequireUserEnrollmentApproval]             VARCHAR(255)        NULL,
    [AzureManagedICCID]                                     VARCHAR(255)        NULL,
    [AzureManagedUDID]                                      VARCHAR(255)        NULL,
    [AzureManagedNotes]                                     VARCHAR(255)        NULL,
    [AzureManagedEthernetMacAddress]                        VARCHAR(255)        NULL,
    -- bigint
    [AzureManagedTotalStorageSpaceInBytes]                  BIGINT              NULL,
    [AzureManagedFreeStorageSpaceInBytes]                   BIGINT              NULL,
    [AzureManagedPhysicalMemoryInBytes]                     BIGINT              NULL,
    -- dates
    [AzureManagedEnrolledDateTime]                          DATETIME2           NULL,
    [AzureManagedLastSyncDateTime]                          DATETIME2           NULL,
    [AzureManagedEASActivationDateTime]                     DATETIME2           NULL,
    [AzureManagedExchangeLastSuccessfulSyncDateTime]        DATETIME2           NULL,
    [AzureManagedComplianceGracePeriodExpirationDateTime]   DATETIME2           NULL,
    [AzureManagedManagementCertificateExpirationDateTime]   DATETIME2           NULL,
    -- azure managed - boolean  
    [AzureManagedIsEASActivated]                            BIT                 NOT NULL    DEFAULT(0),
    [AzureManagedIsAzureADRegistered]                       BIT                 NOT NULL    DEFAULT(0),
    [AzureManagedIsSupervised]                              BIT                 NOT NULL    DEFAULT(0),
    [AzureManagedIsEncrypted]                               BIT                 NOT NULL    DEFAULT(0),
 
    CONSTRAINT [PK_DeviceAzureManagedID] PRIMARY KEY CLUSTERED ([DeviceAzureManagedID] ASC),
)
GO

SET IDENTITY_INSERT DeviceAzureManaged ON
INSERT INTO DeviceAzureManaged (DeviceAzureManagedID, AzureManagedId) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT DeviceAzureManaged OFF

CREATE NONCLUSTERED INDEX IDX_DeviceAzureManaged_AzureManagedId ON [dbo].[DeviceAzureManaged]([AzureManagedId])
GO
