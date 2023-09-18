CREATE TABLE [dbo].[DeviceCrowdstrike] (
    [DeviceCrowdstrikeID]       			INT                 NOT NULL    IDENTITY(1,1),
    [CrowdstrikeDeviceId]                   VARCHAR(255)        NOT NULL,
    [CrowdstrikeCID]                        VARCHAR(255)        NULL,
    [CrowdstrikeAgentVersion]               VARCHAR(255)        NULL,
    [CrowdstrikeBIOSManufacturer]           VARCHAR(255)        NULL,
    [CrowdstrikeBIOSVersion]                VARCHAR(255)        NULL,
    [CrowdstrikeExternalIP]                 VARCHAR(255)        NULL,
    [CrowdstrikeMACAddress]                 VARCHAR(255)        NULL,
    [CrowdstrikeLocalIP]                    VARCHAR(255)        NULL,
    [CrowdstrikeMachineDomain]              VARCHAR(255)        NULL,
    [CrowdstrikeMajorVersion]               VARCHAR(255)        NULL,
    [CrowdstrikeMinorVersion]               VARCHAR(255)        NULL,
    [CrowdstrikeOSVersion]                  VARCHAR(255)        NULL,
    [CrowdstrikeOSBuild]                    VARCHAR(255)        NULL,
    [CrowdstrikePlatformName]               VARCHAR(255)        NULL,
    [CrowdstrikeReducedFunctionalityMode]   VARCHAR(255)        NULL,
    [CrowdstrikeProductTypeDesc]            VARCHAR(255)        NULL,
    [CrowdstrikeProvisionStatus]            VARCHAR(255)        NULL,
    [CrowdstrikeSerialNumber]               VARCHAR(255)        NULL,
    [CrowdstrikeServicePackMajor]           VARCHAR(255)        NULL,
    [CrowdstrikeServicePackMinor]           VARCHAR(255)        NULL,
    [CrowdstrikeStatus]                     VARCHAR(255)        NULL,
    [CrowdstrikeSystemManufacturer]         VARCHAR(255)        NULL,
    [CrowdstrikeSystemProductName]          VARCHAR(255)        NULL,
    [CrowdstrikeKernelVersion]              VARCHAR(255)        NULL,
    -- datetime
    [CrowdstrikeFirstSeenDateTime]          DATETIME2           NULL,
    [CrowdstrikeLastSeenDateTime]           DATETIME2           NULL,
    [CrowdstrikeModifiedDateTime]           DATETIME2           NULL,
 
    CONSTRAINT [PK_DeviceCrowdstrikeID] PRIMARY KEY CLUSTERED ([DeviceCrowdstrikeID] ASC),
)
GO

SET IDENTITY_INSERT DeviceCrowdstrike ON
INSERT INTO DeviceCrowdstrike(DeviceCrowdstrikeID, CrowdstrikeDeviceId) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT DeviceCrowdstrike OFF


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

    DECLARE @DeviceCrowdstrikeID INT
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



