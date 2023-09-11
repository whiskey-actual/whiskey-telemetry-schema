CREATE TABLE [dbo].[DeviceAzureActiveDirectory] (
    [DeviceAzureActiveDirectoryID]			UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [AzureId]                               VARCHAR(255)        NOT NULL,
    [AzureDeviceId]                         VARCHAR(255)        NOT NULL,
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
    [AzureOperatingSystem]                  VARCHAR(255)        NULL, -- always null
    [AzureOperatingSystemVersion]           VARCHAR(255)        NULL,
    [AzureProfileType]                      VARCHAR(255)        NULL,
    [AzureSourceType]                       VARCHAR(255)        NULL, -- always null
    [AzureTrustType]                        VARCHAR(255)        NULL,
    -- dates
    [AzureDeletedDateTime]                  DATETIME2           NULL,
    [AzureApproximateLastSignInDateTime]    DATETIME2           NULL,
    [AzureComplianceExpirationDateTime]     DATETIME2           NULL,
    [AzureCreatedDateTime]                  DATETIME2           NOT NULL,
    [AzureOnPremisesLastSyncDateTime]       DATETIME2           NULL,
    [AzureRegistrationDateTime]             DATETIME2           NULL,
    -- booleans
    [AzureOnPremisesSyncEnabled]            BIT                 NOT NULL DEFAULT((0)),
    [AzureAccountEnabled]                   BIT                 NOT NULL DEFAULT((0)),
    [AzureIsCompliant]                      BIT                 NOT NULL DEFAULT((0)),
    [AzureIsManaged]                        BIT                 NOT NULL DEFAULT((0)),
    [AzureIsRooted]                         BIT                 NOT NULL DEFAULT((0)),
    

    CONSTRAINT [PK_DeviceAzureActiveDirectoryID] PRIMARY KEY CLUSTERED ([DeviceAzureActiveDirectoryID] ASC),
);
GO


CREATE PROCEDURE dbo.sp_add_device_azureActiveDirectory 
    @deviceName                             VARCHAR(255),
    @AzureId                                VARCHAR(255),
    @AzureDeviceCategory			        VARCHAR(255),
    @AzureDeviceId				            VARCHAR(255),
    @AzureDeviceMetadata			        VARCHAR(255),
    @AzureDeviceOwnership			        VARCHAR(255),
    @AzureDeviceVersion				        VARCHAR(255),
    @AzureDomainName				        VARCHAR(255),
    @AzureEnrollmentProfileType		        VARCHAR(255),
    @AzureEnrollmentType			        VARCHAR(255),
    @AzureExternalSourceName		        VARCHAR(255),
    @AzureManagementType			        VARCHAR(255),
    @AzureManufacturer				        VARCHAR(255),
    @AzureMDMAppId				            VARCHAR(255),
    @AzureModel				                VARCHAR(255),
    @AzureOperatingSystem			        VARCHAR(255),
    @AzureOperatingSystemVersion	        VARCHAR(255),
    @AzureProfileType				        VARCHAR(255),
    @AzureSourceType				        VARCHAR(255),
    @AzureTrustType				            VARCHAR(255),
    -- dates
    @AzureDeletedDateTime                   DATETIME2,
    @AzureApproximateLastSignInDateTime     DATETIME2,
    @AzureComplianceExpirationDateTime      DATETIME2,
    @AzureCreatedDateTime                   DATETIME2,
    @AzureOnPremisesLastSyncDateTime        DATETIME2,
    @AzureRegistrationDateTime              DATETIME2,
    -- booleans
    @AzureOnPremisesSyncEnabled		        BIT,
    @AzureAccountEnabled                    BIT,
    @AzureIsCompliant                       BIT,
    @AzureIsManaged                         BIT,
    @AzureIsRooted                          BIT
AS
BEGIN

    DECLARE @DeviceID UNIQUEIDENTIFIER

    SELECT @DeviceID=DeviceID FROM Device WHERE DeviceName=@deviceName
    
    IF @DeviceID IS NULL
    BEGIN
        INSERT INTO Device(DeviceName, DeviceObservedByAzureActiveDirectory) VALUES (@DeviceName, 1)
        SELECT @DeviceID=DeviceID FROM Device WHERE DeviceName=@deviceName
    END

    DECLARE @DeviceAzureActiveDirectoryID UNIQUEIDENTIFIER
    SELECT @DeviceAzureActiveDirectoryID=DeviceAzureActiveDirectoryID FROM Device WHERE DeviceID=@DeviceID

    IF @DeviceAzureActiveDirectoryID IS NULL
    BEGIN
        INSERT INTO
            DeviceAzureActiveDirectory (
                AzureId,
                AzureDeviceCategory,
                AzureDeviceId,
                AzureDeviceMetadata,
                AzureDeviceOwnership,
                AzureDeviceVersion,
                AzureDomainName,
                AzureEnrollmentProfileType,
                AzureEnrollmentType,
                AzureExternalSourceName,
                AzureManagementType,
                AzureManufacturer,
                AzureMDMAppId,
                AzureModel,
                AzureOperatingSystem,
                AzureOperatingSystemVersion,
                AzureProfileType,
                AzureSourceType,
                AzureTrustType,
                AzureDeletedDateTime,
                AzureApproximateLastSignInDateTime,
                AzureComplianceExpirationDateTime,
                AzureCreatedDateTime,
                AzureOnPremisesLastSyncDateTime,
                AzureRegistrationDateTime,
                AzureOnPremisesSyncEnabled,
                AzureAccountEnabled,
                AzureIsCompliant,
                AzureIsManaged,
                AzureIsRooted
            ) VALUES (
                @AzureId,
                @AzureDeviceCategory,
                @AzureDeviceId,
                @AzureDeviceMetadata,
                @AzureDeviceOwnership,
                @AzureDeviceVersion,
                @AzureDomainName,
                @AzureEnrollmentProfileType,
                @AzureEnrollmentType,
                @AzureExternalSourceName,
                @AzureManagementType,
                @AzureManufacturer,
                @AzureMDMAppId,
                @AzureModel,
                @AzureOperatingSystem,
                @AzureOperatingSystemVersion,
                @AzureProfileType,
                @AzureSourceType,
                @AzureTrustType,
                @AzureDeletedDateTime,
                @AzureApproximateLastSignInDateTime,
                @AzureComplianceExpirationDateTime,
                @AzureCreatedDateTime,
                @AzureOnPremisesLastSyncDateTime,
                @AzureRegistrationDateTime,
                @AzureOnPremisesSyncEnabled,
                @AzureAccountEnabled,
                @AzureIsCompliant,
                @AzureIsManaged,
                @AzureIsRooted
            )

            SELECT @DeviceAzureActiveDirectoryID=DeviceAzureActiveDirectoryID FROM DeviceAzureActiveDirectory WHERE AzureID=@AzureID

            UPDATE Device SET DeviceAzureActiveDirectoryID=@DeviceAzureActiveDirectoryID WHERE DeviceID=@DeviceID
    END
    ELSE
    BEGIN

        UPDATE Device SET DeviceObservedByAzureActiveDirectory=1

        UPDATE
            DeviceAzureActiveDirectory
        SET
            AzureId=@AzureId,
            AzureDeviceCategory=@AzureDeviceCategory,
            AzureDeviceId=@AzureDeviceId,
            AzureDeviceMetadata=@AzureDeviceMetadata,
            AzureDeviceOwnership=@AzureDeviceOwnership,
            AzureDeviceVersion=@AzureDeviceVersion,
            AzureDomainName=@AzureDomainName,
            AzureEnrollmentProfileType=@AzureEnrollmentProfileType,
            AzureEnrollmentType=@AzureEnrollmentType,
            AzureExternalSourceName=@AzureExternalSourceName,
            AzureManagementType=@AzureManagementType,
            AzureManufacturer=@AzureManufacturer,
            AzureMDMAppId=@AzureMDMAppId,
            AzureModel=@AzureModel,
            AzureOperatingSystem=@AzureOperatingSystem,
            AzureOperatingSystemVersion=@AzureOperatingSystemVersion,
            AzureProfileType=@AzureProfileType,
            AzureSourceType=@AzureSourceType,
            AzureTrustType=@AzureTrustType,
            AzureDeletedDateTime=@AzureDeletedDateTime,
            AzureApproximateLastSignInDateTime=@AzureApproximateLastSignInDateTime,
            AzureComplianceExpirationDateTime=@AzureComplianceExpirationDateTime,
            AzureCreatedDateTime=@AzureCreatedDateTime,
            AzureOnPremisesLastSyncDateTime=@AzureOnPremisesLastSyncDateTime,
            AzureRegistrationDateTime=@AzureRegistrationDateTime,
            AzureOnPremisesSyncEnabled=@AzureOnPremisesSyncEnabled,
            AzureAccountEnabled=@AzureAccountEnabled,
            AzureIsCompliant=@AzureIsCompliant,
            AzureIsManaged=@AzureIsManaged,
            AzureIsRooted=@AzureIsRooted
        WHERE
            DeviceAzureActiveDirectoryID=@DeviceAzureActiveDirectoryID
    END



END