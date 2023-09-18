CREATE TABLE [dbo].[DeviceAzureManaged] (
    [DeviceAzureManagedID]      			                INT                 NOT NULL    IDENTITY(1,1),
    [AzureManagedId]                                        VARCHAR(255)        NOT NULL,
    [AzureManagedDeviceName]                                VARCHAR(255)        NULL,
    [AzureManagedUserId]                                    VARCHAR(255)        NULL,
    [AzureManagedManagedDeviceOwnerType]                    VARCHAR(255)        NULL,
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
    [AzureManagedConfigurationManagerClientEnabedFeatures]  VARCHAR(255)        NULL,
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


CREATE PROCEDURE dbo.sp_add_azureManaged_device
    @deviceName                                            VARCHAR(255),
    @AzureManagedDeviceName                                VARCHAR(255),
    @AzureManagedId                                        VARCHAR(255),
    @AzureManagedUserId                                    VARCHAR(255),
    @AzureManagedManagedDeviceOwnerType                    VARCHAR(255),
    @AzureManagedOperatingSystem                           VARCHAR(255),
    @AzureManagedComplianceState                           VARCHAR(255),
    @AzureManagedJailBroken                                VARCHAR(255),
    @AzureManagedManagementAgent                           VARCHAR(255),
    @AzureManagedOperatingSystemVersion                    VARCHAR(255),
    @AzureManagedEASDeviceID                               VARCHAR(255),
    @AzureManagedDeviceEnrollmentType                      VARCHAR(255),
    @AzureManagedActivationLockBypassCode                  VARCHAR(255),
    @AzureManagedEmailAddress                              VARCHAR(255),
    @AzureManagedAzureADDeviceID                           VARCHAR(255),
    @AzureManagedDeviceRegistrationState                   VARCHAR(255),
    @AzureManagedDeviceCategoryDisplayName                 VARCHAR(255),
    @AzureManagedExchangeAccessState                       VARCHAR(255),
    @AzureManagedExchangeAccessStateReason                 VARCHAR(255),
    @AzureManagedRemoteAssistanceSessionUrl                VARCHAR(255),
    @AzureManagedRemoteAssistanceErrorDetails              VARCHAR(255),
    @AzureManagedUserPrincipalName                         VARCHAR(255),
    @AzureManagedModel                                     VARCHAR(255),
    @AzureManagedManufacturer                              VARCHAR(255),
    @AzureManagedIMEI                                      VARCHAR(255),
    @AzureManagedSerialNumber                              VARCHAR(255),
    @AzureManagedPhoneNumber                               VARCHAR(255),
    @AzureManagedAndroidSecurityPatchLevel                 VARCHAR(255),
    @AzureManagedUserDisplayName                           VARCHAR(255),
    @AzureManagedConfigurationManagerClientEnabedFeatures  VARCHAR(255),
    @AzureManagedWiFiMACAddress                            VARCHAR(255),
    @AzureManagedDeviceHealthAttestationState              VARCHAR(255),
    @AzureManagedSubscriberCarrier                         VARCHAR(255),
    @AzureManagedMEID                                      VARCHAR(255),
    @AzureManagedPartnerReportedThreatState                VARCHAR(255),
    @AzureManagedRequireUserEnrollmentApproval             VARCHAR(255),
    @AzureManagedICCID                                     VARCHAR(255),
    @AzureManagedUDID                                      VARCHAR(255),
    @AzureManagedNotes                                     VARCHAR(255),
    @AzureManagedEthernetMacAddress                        VARCHAR(255),
    -- bigint
    @AzureManagedTotalStorageSpaceInBytes                  BIGINT,
    @AzureManagedFreeStorageSpaceInBytes                   BIGINT,
    @AzureManagedPhysicalMemoryInBytes                     BIGINT,
    -- dates
    @AzureManagedEnrolledDateTime                          DATETIME2,
    @AzureManagedLastSyncDateTime                          DATETIME2,
    @AzureManagedEASActivationDateTime                     DATETIME2,
    @AzureManagedExchangeLastSuccessfulSyncDateTime        DATETIME2,
    @AzureManagedComplianceGracePeriodExpirationDateTime   DATETIME2,
    @AzureManagedManagementCertificateExpirationDateTime   DATETIME2,
    -- boolean  
    @AzureManagedIsEASActivated                            BIT,
    @AzureManagedIsAzureADRegistered                       BIT,
    @AzureManagedIsSupervised                              BIT,
    @AzureManagedIsEncrypted                               BIT
AS
BEGIN

    DECLARE @DeviceID INT

    SELECT @DeviceID=DeviceID FROM Device WHERE DeviceName=@deviceName
    
    IF @DeviceID IS NULL
    BEGIN
        INSERT INTO Device(DeviceName) VALUES (@DeviceName)
        SELECT @DeviceID=DeviceID FROM Device WHERE DeviceName=@deviceName
    END

    DECLARE @DeviceAzureManagedID INT
    SELECT @DeviceAzureManagedID=DeviceAzureManagedID FROM Device WHERE DeviceID=@DeviceID

    IF @DeviceAzureManagedID IS NULL
    BEGIN
        INSERT INTO
            DeviceAzureManaged (
                AzureManagedId,
                AzureManagedDeviceName,
                AzureManagedUserId,
                AzureManagedManagedDeviceOwnerType,
                AzureManagedOperatingSystem,
                AzureManagedComplianceState,
                AzureManagedJailBroken,
                AzureManagedManagementAgent,
                AzureManagedOperatingSystemVersion,
                AzureManagedEASDeviceID,
                AzureManagedDeviceEnrollmentType,
                AzureManagedActivationLockBypassCode,
                AzureManagedEmailAddress,
                AzureManagedAzureADDeviceID,
                AzureManagedDeviceRegistrationState,
                AzureManagedDeviceCategoryDisplayName,
                AzureManagedExchangeAccessState,
                AzureManagedExchangeAccessStateReason,
                AzureManagedRemoteAssistanceSessionUrl,
                AzureManagedRemoteAssistanceErrorDetails,
                AzureManagedUserPrincipalName,
                AzureManagedModel,
                AzureManagedManufacturer,
                AzureManagedIMEI,
                AzureManagedSerialNumber,
                AzureManagedPhoneNumber,
                AzureManagedAndroidSecurityPatchLevel,
                AzureManagedUserDisplayName,
                AzureManagedConfigurationManagerClientEnabedFeatures,
                AzureManagedWiFiMACAddress,
                AzureManagedDeviceHealthAttestationState,
                AzureManagedSubscriberCarrier,
                AzureManagedMEID,
                AzureManagedTotalStorageSpaceInBytes,
                AzureManagedFreeStorageSpaceInBytes,
                AzureManagedPartnerReportedThreatState,
                AzureManagedRequireUserEnrollmentApproval,
                AzureManagedICCID,
                AzureManagedUDID,
                AzureManagedNotes,
                AzureManagedEthernetMacAddress,
                AzureManagedPhysicalMemoryInBytes,
                AzureManagedEnrolledDateTime,
                AzureManagedLastSyncDateTime,
                AzureManagedEASActivationDateTime,
                AzureManagedExchangeLastSuccessfulSyncDateTime,
                AzureManagedComplianceGracePeriodExpirationDateTime,
                AzureManagedManagementCertificateExpirationDateTime,
                AzureManagedIsEASActivated,
                AzureManagedIsAzureADRegistered,
                AzureManagedIsSupervised,
                AzureManagedIsEncrypted
            ) VALUES (
                @AzureManagedId,
                @AzureManagedDeviceName,
                @AzureManagedUserId,
                @AzureManagedManagedDeviceOwnerType,
                @AzureManagedOperatingSystem,
                @AzureManagedComplianceState,
                @AzureManagedJailBroken,
                @AzureManagedManagementAgent,
                @AzureManagedOperatingSystemVersion,
                @AzureManagedEASDeviceID,
                @AzureManagedDeviceEnrollmentType,
                @AzureManagedActivationLockBypassCode,
                @AzureManagedEmailAddress,
                @AzureManagedAzureADDeviceID,
                @AzureManagedDeviceRegistrationState,
                @AzureManagedDeviceCategoryDisplayName,
                @AzureManagedExchangeAccessState,
                @AzureManagedExchangeAccessStateReason,
                @AzureManagedRemoteAssistanceSessionUrl,
                @AzureManagedRemoteAssistanceErrorDetails,
                @AzureManagedUserPrincipalName,
                @AzureManagedModel,
                @AzureManagedManufacturer,
                @AzureManagedIMEI,
                @AzureManagedSerialNumber,
                @AzureManagedPhoneNumber,
                @AzureManagedAndroidSecurityPatchLevel,
                @AzureManagedUserDisplayName,
                @AzureManagedConfigurationManagerClientEnabedFeatures,
                @AzureManagedWiFiMACAddress,
                @AzureManagedDeviceHealthAttestationState,
                @AzureManagedSubscriberCarrier,
                @AzureManagedMEID,
                @AzureManagedTotalStorageSpaceInBytes,
                @AzureManagedFreeStorageSpaceInBytes,
                @AzureManagedPartnerReportedThreatState,
                @AzureManagedRequireUserEnrollmentApproval,
                @AzureManagedICCID,
                @AzureManagedUDID,
                @AzureManagedNotes,
                @AzureManagedEthernetMacAddress,
                @AzureManagedPhysicalMemoryInBytes,
                @AzureManagedEnrolledDateTime,
                @AzureManagedLastSyncDateTime,
                @AzureManagedEASActivationDateTime,
                @AzureManagedExchangeLastSuccessfulSyncDateTime,
                @AzureManagedComplianceGracePeriodExpirationDateTime,
                @AzureManagedManagementCertificateExpirationDateTime,
                @AzureManagedIsEASActivated,
                @AzureManagedIsAzureADRegistered,
                @AzureManagedIsSupervised,
                @AzureManagedIsEncrypted
            )

            SELECT @DeviceAzureManagedID=DeviceAzureManagedID FROM DeviceAzureManaged WHERE AzureManagedId=@AzureManagedId

            UPDATE Device SET DeviceAzureManagedID=@DeviceAzureManagedID WHERE DeviceID=@DeviceID
    END
    ELSE
    BEGIN

        UPDATE
            DeviceAzureManaged
        SET
            AzureManagedId=@AzureManagedId,
            AzureManagedDeviceName=@AzureManagedDeviceName,
            AzureManagedUserId=@AzureManagedUserId,
            AzureManagedManagedDeviceOwnerType=@AzureManagedManagedDeviceOwnerType,
            AzureManagedOperatingSystem=@AzureManagedOperatingSystem,
            AzureManagedComplianceState=@AzureManagedComplianceState,
            AzureManagedJailBroken=@AzureManagedJailBroken,
            AzureManagedManagementAgent=@AzureManagedManagementAgent,
            AzureManagedOperatingSystemVersion=@AzureManagedOperatingSystemVersion,
            AzureManagedEASDeviceID=@AzureManagedEASDeviceID,
            AzureManagedDeviceEnrollmentType=@AzureManagedDeviceEnrollmentType,
            AzureManagedActivationLockBypassCode=@AzureManagedActivationLockBypassCode,
            AzureManagedEmailAddress=@AzureManagedEmailAddress,
            AzureManagedAzureADDeviceID=@AzureManagedAzureADDeviceID,
            AzureManagedDeviceRegistrationState=@AzureManagedDeviceRegistrationState,
            AzureManagedDeviceCategoryDisplayName=@AzureManagedDeviceCategoryDisplayName,
            AzureManagedExchangeAccessState=@AzureManagedExchangeAccessState,
            AzureManagedExchangeAccessStateReason=@AzureManagedExchangeAccessStateReason,
            AzureManagedRemoteAssistanceSessionUrl=@AzureManagedRemoteAssistanceSessionUrl,
            AzureManagedRemoteAssistanceErrorDetails=@AzureManagedRemoteAssistanceErrorDetails,
            AzureManagedUserPrincipalName=@AzureManagedUserPrincipalName,
            AzureManagedModel=@AzureManagedModel,
            AzureManagedManufacturer=@AzureManagedManufacturer,
            AzureManagedIMEI=@AzureManagedIMEI,
            AzureManagedSerialNumber=@AzureManagedSerialNumber,
            AzureManagedPhoneNumber=@AzureManagedPhoneNumber,
            AzureManagedAndroidSecurityPatchLevel=@AzureManagedAndroidSecurityPatchLevel,
            AzureManagedUserDisplayName=@AzureManagedUserDisplayName,
            AzureManagedConfigurationManagerClientEnabedFeatures=@AzureManagedConfigurationManagerClientEnabedFeatures,
            AzureManagedWiFiMACAddress=@AzureManagedWiFiMACAddress,
            AzureManagedDeviceHealthAttestationState=@AzureManagedDeviceHealthAttestationState,
            AzureManagedSubscriberCarrier=@AzureManagedSubscriberCarrier,
            AzureManagedMEID=@AzureManagedMEID,
            AzureManagedTotalStorageSpaceInBytes=@AzureManagedTotalStorageSpaceInBytes,
            AzureManagedFreeStorageSpaceInBytes=@AzureManagedFreeStorageSpaceInBytes,
            AzureManagedPartnerReportedThreatState=@AzureManagedPartnerReportedThreatState,
            AzureManagedRequireUserEnrollmentApproval=@AzureManagedRequireUserEnrollmentApproval,
            AzureManagedICCID=@AzureManagedICCID,
            AzureManagedUDID=@AzureManagedUDID,
            AzureManagedNotes=@AzureManagedNotes,
            AzureManagedEthernetMacAddress=@AzureManagedEthernetMacAddress,
            AzureManagedPhysicalMemoryInBytes=@AzureManagedPhysicalMemoryInBytes,
            AzureManagedEnrolledDateTime=@AzureManagedEnrolledDateTime,
            AzureManagedLastSyncDateTime=@AzureManagedLastSyncDateTime,
            AzureManagedEASActivationDateTime=@AzureManagedEASActivationDateTime,
            AzureManagedExchangeLastSuccessfulSyncDateTime=@AzureManagedExchangeLastSuccessfulSyncDateTime,
            AzureManagedComplianceGracePeriodExpirationDateTime=@AzureManagedComplianceGracePeriodExpirationDateTime,
            AzureManagedManagementCertificateExpirationDateTime=@AzureManagedManagementCertificateExpirationDateTime,
            AzureManagedIsEASActivated=@AzureManagedIsEASActivated,
            AzureManagedIsAzureADRegistered=@AzureManagedIsAzureADRegistered,
            AzureManagedIsSupervised=@AzureManagedIsSupervised,
            AzureManagedIsEncrypted=@AzureManagedIsEncrypted
        WHERE
            DeviceAzureManagedID=@DeviceAzureManagedID
    END



END