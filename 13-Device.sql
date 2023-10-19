CREATE TABLE [dbo].[Device] (
    [DeviceID]					            INT                 NOT NULL    IDENTITY(1,1),
    [DeviceName]                            VARCHAR(255)        NOT NULL,
    [DeviceIsActive]                        BIT                 NOT NULL    DEFAULT((0)),
    [DeviceFirstObserved]                   DATETIME2           NOT NULL    DEFAULT(SYSDATETIME()),
    [DeviceLastObserved]                    DATETIME2           NOT NULL    DEFAULT(SYSDATETIME()),

    -- AD
    [ad_DN]                      VARCHAR(255)        NULL,
    [ad_DNSHostName]             VARCHAR(255)        NULL,
    [ad_OperatingSystem]            VARCHAR(255)        NULL,
    [ad_OperatingSystemVersion]     VARCHAR(255)        NULL,
    [ad_LogonCount]              INT                 NOT NULL    DEFAULT((0)),
    [ad_WhenCreated]             DATETIME2           NULL,
    [ad_WhenChanged]             DATETIME2           NULL,
    [ad_LastLogon]               DATETIME2           NULL,
    [ad_PwdLastSet]              DATETIME2           NULL,
    [ad_LastLogonTimestamp]      DATETIME2           NULL,
    [ad_LastSeen]                DATETIME2           NULL,

    -- AAD
    [aad_DeviceId]                         VARCHAR(255)        NULL,
    [aad_Id]                               VARCHAR(255)        NULL,
    [aad_DeviceCategory]                   VARCHAR(255)        NULL,
    [aad_DeviceMetadata]                   VARCHAR(255)        NULL, -- always null
    [aad_DeviceOwnership]                  VARCHAR(255)        NULL,
    [aad_DeviceVersion]                    VARCHAR(255)        NULL,
    [aad_DomainName]                       VARCHAR(255)        NULL, -- always null
    [aad_EnrollmentProfileType]            VARCHAR(255)        NULL, -- always null
    [aad_EnrollmentType]                   VARCHAR(255)        NULL,
    [aad_ExternalSourceName]               VARCHAR(255)        NULL, -- always null
    [aad_ManagementType]                   VARCHAR(255)        NULL,
    [aad_Manufacturer]                     VARCHAR(255)        NULL,
    [aad_MDMAppId]                         VARCHAR(255)        NULL,
    [aad_Model]                            VARCHAR(255)        NULL,
    [aad_ProfileType]                      VARCHAR(255)        NULL,
    [aad_SourceType]                       VARCHAR(255)        NULL, -- always null
    [aad_TrustType]                        VARCHAR(255)        NULL,
    [add_OperatingSystem]                   VARCHAR(255)        NULL,
    [add_OperatingSystemVersion]            VARCHAR(255)        NULL,
    [aad_DeletedDateTime]                  DATETIME2           NULL,
    [aad_ApproximateLastSignInDateTime]    DATETIME2           NULL,
    [aad_ComplianceExpirationDateTime]     DATETIME2           NULL,
    [aad_CreatedDateTime]                  DATETIME2           NULL,
    [aad_OnPremisesLastSyncDateTime]       DATETIME2           NULL,
    [aad_RegistrationDateTime]             DATETIME2           NULL,
    [add_LastSeen]                          DATETIME2           NULL,
    [aad_OnPremisesSyncEnabled]            BIT                 NOT NULL DEFAULT((0)),
    [aad_AccountEnabled]                   BIT                 NOT NULL DEFAULT((0)),
    [aad_IsCompliant]                      BIT                 NOT NULL DEFAULT((0)),
    [aad_IsManaged]                        BIT                 NOT NULL DEFAULT((0)),
    [aad_IsRooted]                         BIT                 NOT NULL DEFAULT((0)),

    -- Azure MDM
    [mdm_Id]                                        VARCHAR(255)        NULL,
    [mdm_DeviceName]                                VARCHAR(255)        NULL,
    [mdm_UserId]                                    VARCHAR(255)        NULL,
    [mdm_DeviceOwnerType]                           VARCHAR(255)        NULL,
    [mdm_ComplianceState]                           VARCHAR(255)        NULL,
    [mdm_JailBroken]                                VARCHAR(255)        NULL,
    [mdm_ManagementAgent]                           VARCHAR(255)        NULL,
    [mdm_OperatingSystem]                           VARCHAR(255)        NULL,
    [mdm_OperatingSystemVersion]                    VARCHAR(255)        NULL,
    [mdm_EASDeviceID]                               VARCHAR(255)        NULL,
    [mdm_DeviceEnrollmentType]                      VARCHAR(255)        NULL,
    [mdm_ActivationLockBypassCode]                  VARCHAR(255)        NULL,
    [mdm_EmailAddress]                              VARCHAR(255)        NULL,
    [mdm_AzureADDeviceID]                           VARCHAR(255)        NULL,
    [mdm_DeviceRegistrationState]                   VARCHAR(255)        NULL,
    [mdm_DeviceCategoryDisplayName]                 VARCHAR(255)        NULL,
    [mdm_ExchangeAccessState]                       VARCHAR(255)        NULL,
    [mdm_ExchangeAccessStateReason]                 VARCHAR(255)        NULL,
    [mdm_RemoteAssistanceSessionUrl]                VARCHAR(255)        NULL,
    [mdm_RemoteAssistanceErrorDetails]              VARCHAR(255)        NULL,
    [mdm_UserPrincipalName]                         VARCHAR(255)        NULL,
    [mdm_Model]                                     VARCHAR(255)        NULL,
    [mdm_Manufacturer]                              VARCHAR(255)        NULL,
    [mdm_IMEI]                                      VARCHAR(255)        NULL,
    [mdm_SerialNumber]                              VARCHAR(255)        NULL,
    [mdm_PhoneNumber]                               VARCHAR(255)        NULL,
    [mdm_AndroidSecurityPatchLevel]                 VARCHAR(255)        NULL,
    [mdm_UserDisplayName]                           VARCHAR(255)        NULL,
    [mdm_ConfigurationManagerClientEnabledFeatures] VARCHAR(255)        NULL,
    [mdm_WiFiMACAddress]                            VARCHAR(255)        NULL,
    [mdm_DeviceHealthAttestationState]              VARCHAR(255)        NULL,
    [mdm_SubscriberCarrier]                         VARCHAR(255)        NULL,
    [mdm_MEID]                                      VARCHAR(255)        NULL,
    [mdm_PartnerReportedThreatState]                VARCHAR(255)        NULL,
    [mdm_RequireUserEnrollmentApproval]             VARCHAR(255)        NULL,
    [mdm_ICCID]                                     VARCHAR(255)        NULL,
    [mdm_UDID]                                      VARCHAR(255)        NULL,
    [mdm_Notes]                                     VARCHAR(255)        NULL,
    [mdm_EthernetMacAddress]                        VARCHAR(255)        NULL,
    [mdm_TotalStorageSpaceInBytes]                  BIGINT              NULL,
    [mdm_FreeStorageSpaceInBytes]                   BIGINT              NULL,
    [mdm_PhysicalMemoryInBytes]                     BIGINT              NULL,
    [mdm_EnrolledDateTime]                          DATETIME2           NULL,
    [mdm_LastSyncDateTime]                          DATETIME2           NULL,
    [mdm_EASActivationDateTime]                     DATETIME2           NULL,
    [mdm_ExchangeLastSuccessfulSyncDateTime]        DATETIME2           NULL,
    [mdm_ComplianceGracePeriodExpirationDateTime]   DATETIME2           NULL,
    [mdm_ManagementCertificateExpirationDateTime]   DATETIME2           NULL,
    [mdm_LastSeen]                                  DATETIME2           NULL,
    [mdm_IsEASActivated]                            BIT                 NOT NULL    DEFAULT(0),
    [mdm_IsAzureADRegistered]                       BIT                 NOT NULL    DEFAULT(0),
    [mdm_IsSupervised]                              BIT                 NOT NULL    DEFAULT(0),
    [mdm_IsEncrypted]                               BIT                 NOT NULL    DEFAULT(0),

    -- Connectwise
    [cw_Id]                         VARCHAR(255)        NULL,
    [cw_DeviceType]                 VARCHAR(255)        NULL, 
    [cw_Location]                   VARCHAR(255)        NULL, 
    [cw_Client]                     VARCHAR(255)        NULL, 
    [cw_OperatingSystemXRefID]      INT                 NOT NULL    DEFAULT((0)),
    [cw_OperatingSystemVersion]     VARCHAR(255)        NULL, 
    [cw_DomainName]                 VARCHAR(255)        NULL, 
    [cw_AgentVersion]               VARCHAR(255)        NULL, 
    [cw_Comment]                    VARCHAR(255)        NULL, 
    [cw_IpAddress]                  VARCHAR(255)        NULL, 
    [cw_MacAddress]                 VARCHAR(255)        NULL,
    [cw_LastUserName]               VARCHAR(255)        NULL, 
    [cw_Status]                     VARCHAR(255)        NULL, 
    [cw_SerialNumber]               VARCHAR(255)        NULL, 
    [cw_Manufacturer]               VARCHAR(255)        NULL, 
    [cw_Model]                      VARCHAR(255)        NULL, 
    [cw_Description]                VARCHAR(255)        NULL, 
    [cw_TotalMemory]                BIGINT              NULL, 
    [cw_FreeMemory]                 BIGINT              NULL, 
    [cw_FirstSeen]                  DATETIME2           NULL, 
    [cw_LastObserved]               DATETIME2           NULL, 
    [cw_WindowsUpdateDate]          DATETIME2           NULL,
    [cw_AntivirusDefinitionDate]    DATETIME2           NULL,
    [cw_AssetDate]                  DATETIME2           NULL,

    -- Crowdstrike
    [cs_DeviceId]                   VARCHAR(255)        NULL,
    [cs_CID]                        VARCHAR(255)        NULL,
    [cs_AgentVersion]               VARCHAR(255)        NULL,
    [cs_BIOSManufacturer]           VARCHAR(255)        NULL,
    [cs_BIOSVersion]                VARCHAR(255)        NULL,
    [cs_ExternalIP]                 VARCHAR(255)        NULL,
    [cs_MACAddress]                 VARCHAR(255)        NULL,
    [cs_LocalIP]                    VARCHAR(255)        NULL,
    [cs_MachineDomain]              VARCHAR(255)        NULL,
    [cs_MajorVersion]               VARCHAR(255)        NULL,
    [cs_MinorVersion]               VARCHAR(255)        NULL,
    [cs_OSVersion]                  VARCHAR(255)        NULL,
    [cs_OSBuild]                    VARCHAR(255)        NULL,
    [cs_PlatformName]               VARCHAR(255)        NULL,
    [cs_ReducedFunctionalityMode]   VARCHAR(255)        NULL,
    [cs_ProductTypeDesc]            VARCHAR(255)        NULL,
    [cs_ProvisionStatus]            VARCHAR(255)        NULL,
    [cs_SerialNumber]               VARCHAR(255)        NULL,
    [cs_ServicePackMajor]           VARCHAR(255)        NULL,
    [cs_ServicePackMinor]           VARCHAR(255)        NULL,
    [cs_Status]                     VARCHAR(255)        NULL,
    [cs_SystemManufacturer]         VARCHAR(255)        NULL,
    [cs_SystemProductName]          VARCHAR(255)        NULL,
    [cs_KernelVersion]              VARCHAR(255)        NULL,
    [cs_FirstSeenDateTime]          DATETIME2           NULL,
    [cs_LastSeenDateTime]           DATETIME2           NULL,
    [cs_ModifiedDateTime]           DATETIME2           NULL,

    -- keys
    CONSTRAINT [PK_DeviceID] PRIMARY KEY CLUSTERED ([DeviceID] ASC),
);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_DeviceName] ON [dbo].[Device]([DeviceName] ASC);
GO

CREATE NONCLUSTERED INDEX [IDX_Device_DeviceIsActive] ON [dbo].[Device]([DeviceISActive] DESC);
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_Device_ad_DN ON [dbo].[Device]([ad_DN])
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_Device_aad_DeviceID ON [dbo].[Device]([aad_DeviceId])
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_Device_mdm_Id ON [dbo].[Device]([mdm_Id])
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_Device_cw_Id ON [dbo].[Device]([cw_Id])
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_Device_cs_DeviceId ON [dbo].[Device]([cs_DeviceId])
GO