CREATE TABLE [dbo].[DeviceCrowdstrike] (
    [DeviceCrowdstrikeID]       			UNIQUEIDENTIFIER    NOT NULL    DEFAULT NEWSEQUENTIALID(),
    [CrowdstrikeDeviceId]                   VARCHAR(255)        NOT NULL,
    [CrowdstrikeCID]                        VARCHAR(255)        NOT NULL,
    [CrowdstrikeAgentVersion]               VARCHAR(255)        NOT NULL,
    [CrowdstrikeBIOSManufacturer]           VARCHAR(255)        NOT NULL,
    [CrowdstrikeBIOSVersion]                VARCHAR(255)        NOT NULL,
    [CrowdstrikeExternalIP]                 VARCHAR(255)        NULL,
    [CrowdstrikeMACAddress]                 VARCHAR(255)        NOT NULL,
    [CrowdstrikeLocalIP]                    VARCHAR(255)        NOT NULL,
    [CrowdstrikeMachineDomain]              VARCHAR(255)        NOT NULL,
    [CrowdstrikeMajorVersion]               VARCHAR(255)        NOT NULL,
    [CrowdstrikeMinorVersion]               VARCHAR(255)        NOT NULL,
    [CrowdstrikeOSVersion]                  VARCHAR(255)        NOT NULL,
    [CrowdstrikeOSBuild]                    VARCHAR(255)        NOT NULL,
    [CrowdstrikePlatformName]               VARCHAR(255)        NOT NULL,
    [CrowdstrikeReducedFunctionalityMode]   VARCHAR(255)        NOT NULL,
    [CrowdstrikeProductTypeDesc]            VARCHAR(255)        NOT NULL,
    [CrowdstrikeProvisionStatus]            VARCHAR(255)        NOT NULL,
    [CrowdstrikeSerialNumber]               VARCHAR(255)        NOT NULL,
    [CrowdstrikeServicePackMajor]           VARCHAR(255)        NOT NULL,
    [CrowdstrikeServicePackMinor]           VARCHAR(255)        NOT NULL,
    [CrowdstrikeStatus]                     VARCHAR(255)        NOT NULL,
    [CrowdstrikeSystemManufacturer]         VARCHAR(255)        NOT NULL,
    [CrowdstrikeSystemProductName]          VARCHAR(255)        NOT NULL,
    [CrowdstrikeKernelVersion]              VARCHAR(255)        NOT NULL,
    -- datetime
    [CrowdstrikeFirstSeenDateTime]          DATETIME2           NOT NULL,
    [CrowdstrikeLastSeenDateTime]           DATETIME2           NOT NULL,
    [CrowdstrikeModifiedDateTime]           DATETIME2           NOT NULL,
 
    CONSTRAINT [PK_DeviceCrowdstrikeID] PRIMARY KEY CLUSTERED ([DeviceCrowdstrikeID] ASC),
)
GO


CREATE NONCLUSTERED INDEX IDX_DeviceCrowdstrike_CrowdstrikeDeviceId ON [dbo].[DeviceCrowdstrike]([CrowdstrikeDeviceId])
GO

CREATE PROCEDURE dbo.sp_add_crowdstrike_device 
    @deviceName                             VARCHAR(255),
    @CrowdstrikeDeviceId                    VARCHAR(255),
    @CrowdstrikeCID                         VARCHAR(255),
    @CrowdstrikeAgentVersion                VARCHAR(255),
    @CrowdstrikeBIOSManufacturer            VARCHAR(255),
    @CrowdstrikeBIOSVersion                 VARCHAR(255),
    @CrowdstrikeExternalIP                  VARCHAR(255),
    @CrowdstrikeMACAddress                  VARCHAR(255),
    @CrowdstrikeLocalIP                     VARCHAR(255),
    @CrowdstrikeMachineDomain               VARCHAR(255),
    @CrowdstrikeMajorVersion                VARCHAR(255),
    @CrowdstrikeMinorVersion                VARCHAR(255),
    @CrowdstrikeOSVersion                   VARCHAR(255),
    @CrowdstrikeOSBuild                     VARCHAR(255),
    @CrowdstrikePlatformName                VARCHAR(255),
    @CrowdstrikeReducedFunctionalityMode    VARCHAR(255),
    @CrowdstrikeProductTypeDesc             VARCHAR(255),
    @CrowdstrikeProvisionStatus             VARCHAR(255),
    @CrowdstrikeSerialNumber                VARCHAR(255),
    @CrowdstrikeServicePackMajor            VARCHAR(255),
    @CrowdstrikeServicePackMinor            VARCHAR(255),
    @CrowdstrikeStatus                      VARCHAR(255),
    @CrowdstrikeSystemManufacturer          VARCHAR(255),
    @CrowdstrikeSystemProductName           VARCHAR(255),
    @CrowdstrikeKernelVersion               VARCHAR(255),
    @CrowdstrikeFirstSeenDateTime           DATETIME2,
    @CrowdstrikeLastSeenDateTime            DATETIME2,
    @CrowdstrikeModifiedDateTime            DATETIME2
AS
BEGIN

    DECLARE @DeviceID UNIQUEIDENTIFIER
    SELECT @DeviceID=DeviceID FROM Device WHERE DeviceName=@deviceName
    IF @DeviceID IS NULL
    BEGIN
        INSERT INTO Device(DeviceName, DeviceObservedByCrowdstrike) VALUES (@DeviceName, 1)
        SELECT @DeviceID=DeviceID FROM Device WHERE DeviceName=@deviceName
    END

    DECLARE @DeviceCrowdstrikeID UNIQUEIDENTIFIER
    SELECT @DeviceCrowdstrikeID=DeviceCrowdstrikeID FROM Device WHERE DeviceID=@DeviceID

    IF @DeviceCrowdstrikeID IS NULL
    BEGIN
        INSERT INTO
            DeviceCrowdstrike (
                CrowdstrikeDeviceId,
                CrowdstrikeCID,
                CrowdstrikeAgentVersion,
                CrowdstrikeBIOSManufacturer,
                CrowdstrikeBIOSVersion,
                CrowdstrikeExternalIP,
                CrowdstrikeMACAddress,
                CrowdstrikeLocalIP,
                CrowdstrikeMachineDomain,
                CrowdstrikeMajorVersion,
                CrowdstrikeMinorVersion,
                CrowdstrikeOSVersion,
                CrowdstrikeOSBuild,
                CrowdstrikePlatformName,
                CrowdstrikeReducedFunctionalityMode,
                CrowdstrikeProductTypeDesc,
                CrowdstrikeProvisionStatus,
                CrowdstrikeSerialNumber,
                CrowdstrikeServicePackMajor,
                CrowdstrikeServicePackMinor,
                CrowdstrikeStatus,
                CrowdstrikeSystemManufacturer,
                CrowdstrikeSystemProductName,
                CrowdstrikeKernelVersion,
                CrowdstrikeFirstSeenDateTime,
                CrowdstrikeLastSeenDateTime,
                CrowdstrikeModifiedDateTime
            ) VALUES (
                @CrowdstrikeDeviceId,
                @CrowdstrikeCID,
                @CrowdstrikeAgentVersion,
                @CrowdstrikeBIOSManufacturer,
                @CrowdstrikeBIOSVersion,
                @CrowdstrikeExternalIP,
                @CrowdstrikeMACAddress,
                @CrowdstrikeLocalIP,
                @CrowdstrikeMachineDomain,
                @CrowdstrikeMajorVersion,
                @CrowdstrikeMinorVersion,
                @CrowdstrikeOSVersion,
                @CrowdstrikeOSBuild,
                @CrowdstrikePlatformName,
                @CrowdstrikeReducedFunctionalityMode,
                @CrowdstrikeProductTypeDesc,
                @CrowdstrikeProvisionStatus,
                @CrowdstrikeSerialNumber,
                @CrowdstrikeServicePackMajor,
                @CrowdstrikeServicePackMinor,
                @CrowdstrikeStatus,
                @CrowdstrikeSystemManufacturer,
                @CrowdstrikeSystemProductName,
                @CrowdstrikeKernelVersion,
                @CrowdstrikeFirstSeenDateTime,
                @CrowdstrikeLastSeenDateTime,
                @CrowdstrikeModifiedDateTime
            )

            SELECT @DeviceCrowdstrikeID=DeviceCrowdstrikeID FROM DeviceCrowdstrike WHERE CrowdstrikeDeviceId=@CrowdstrikeDeviceId

            UPDATE Device SET DeviceObservedByCrowdstrike=1, DeviceCrowdstrikeID=@DeviceCrowdstrikeID WHERE DeviceID=@DeviceID

    END
    ELSE
    BEGIN

        UPDATE
            DeviceCrowdstrike
        SET
            CrowdstrikeDeviceId=@CrowdstrikeDeviceId,
            CrowdstrikeCID=@CrowdstrikeCID,
            CrowdstrikeAgentVersion=@CrowdstrikeAgentVersion,
            CrowdstrikeBIOSManufacturer=@CrowdstrikeBIOSManufacturer,
            CrowdstrikeBIOSVersion=@CrowdstrikeBIOSVersion,
            CrowdstrikeExternalIP=@CrowdstrikeExternalIP,
            CrowdstrikeMACAddress=@CrowdstrikeMACAddress,
            CrowdstrikeLocalIP=@CrowdstrikeLocalIP,
            CrowdstrikeMachineDomain=@CrowdstrikeMachineDomain,
            CrowdstrikeMajorVersion=@CrowdstrikeMajorVersion,
            CrowdstrikeMinorVersion=@CrowdstrikeMinorVersion,
            CrowdstrikeOSVersion=@CrowdstrikeOSVersion,
            CrowdstrikeOSBuild=@CrowdstrikeOSBuild,
            CrowdstrikePlatformName=@CrowdstrikePlatformName,
            CrowdstrikeReducedFunctionalityMode=@CrowdstrikeReducedFunctionalityMode,
            CrowdstrikeProductTypeDesc=@CrowdstrikeProductTypeDesc,
            CrowdstrikeProvisionStatus=@CrowdstrikeProvisionStatus,
            CrowdstrikeSerialNumber=@CrowdstrikeSerialNumber,
            CrowdstrikeServicePackMajor=@CrowdstrikeServicePackMajor,
            CrowdstrikeServicePackMinor=@CrowdstrikeServicePackMinor,
            CrowdstrikeStatus=@CrowdstrikeStatus,
            CrowdstrikeSystemManufacturer=@CrowdstrikeSystemManufacturer,
            CrowdstrikeSystemProductName=@CrowdstrikeSystemProductName,
            CrowdstrikeKernelVersion=@CrowdstrikeKernelVersion,
            CrowdstrikeFirstSeenDateTime=@CrowdstrikeFirstSeenDateTime,
            CrowdstrikeLastSeenDateTime=@CrowdstrikeLastSeenDateTime,
            CrowdstrikeModifiedDateTime=@CrowdstrikeModifiedDateTime
        WHERE
            DeviceCrowdstrikeID=@DeviceCrowdstrikeID
    END



END



