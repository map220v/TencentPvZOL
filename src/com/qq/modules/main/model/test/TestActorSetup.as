package com.qq.modules.main.model.test {
import PVZ.Cmd.Cmd_Battle_GetFormation_SC;
import PVZ.Cmd.Cmd_Init_CS;
import PVZ.Cmd.Cmd_Init_SC;
import PVZ.Cmd.Dto_CardPosInfo;
import PVZ.Cmd.Dto_CardPower;
import PVZ.Cmd.Dto_FormationInfo;
import PVZ.Cmd.Dto_PlantInfo;
import PVZ.Cmd.Dto_ServerConfig;
import PVZ.Cmd.Dto_TDLevelInfo;

import com.qq.GameGloble;
import com.qq.modules.buy.command.MonthCardCmd;
import com.qq.modules.city.model.vo.CityData;
import com.qq.modules.guide.model.GuideUIData;
import com.qq.modules.login.service.LoginService;
import com.qq.modules.main.command.CommonCmd;
import com.qq.modules.main.command.LevelObserverCmd;
import com.qq.modules.main.logic.initData.InitDataManager;
import com.qq.modules.main.model.ActorModel;
import com.qq.utils.DateUtils;
import com.qq.utils.IconUtil;
import com.qq.utils.external.QExternalUtil;
import com.tencent.protobuf.Int64;
import com.tencent.protobuf.Message;
import com.tencent.protobuf.UInt64;

import org.as3commons.logging.api.getLogger;

import tencent.io.service.events.SocketServiceEvent;

public class TestActorSetup {

    [Inject]
    public var actorModel:ActorModel;

    private static var _instance:TestActorSetup;

    public function TestActorSetup() {
        super();
    }

    public static function getInstance() : TestActorSetup {
        if (_instance == null){
            _instance = new TestActorSetup();
        }
        return _instance;
    }

    public function createTestActor() {
        var loginhax:LoginService = GameGloble.injector.getInstance(LoginService);
        var testData:SocketServiceEvent = new SocketServiceEvent(Cmd_Init_SC.$MessageID);
        var testMessage:Cmd_Init_SC = new Cmd_Init_SC();

        testMessage.roleID = new Int64(1);
        testMessage.zoneId = 1;
        testMessage.coin = 1000;
        testMessage.exp = 0;
        testMessage.level = 1;
        testMessage.name = "TestPlayer";
        testMessage.sun  = 20;
        testMessage.lucky = 1;
        testMessage.light  = 2;
        testMessage.puppetSkillVal = 1;
        testMessage.buyPuppetSkillValNum = 0;
        testMessage.puppetEnergy = 1;
        testMessage.buyPuppetEnergyNum = 0;
        testMessage.prestige = 0;

        var latestTDLevelTest:Dto_TDLevelInfo = new Dto_TDLevelInfo();
        latestTDLevelTest.stageId = 0;
        latestTDLevelTest.levelId = 0;
        latestTDLevelTest.subLevelId = 0;
        testMessage.latestTDLevel = latestTDLevelTest;

        testMessage.energy = 20;
        testMessage.friendPoint = 10;

        var faceAvatarTest:Dto_PlantInfo = new Dto_PlantInfo();
        faceAvatarTest.plantId = 1;
        faceAvatarTest.isNew = true;
        faceAvatarTest.avatarId = 1;
        faceAvatarTest.strengthLevel = 200;
        testMessage.faceAvatar = faceAvatarTest;

        testMessage.faceId = 1;
        testMessage.qqFaceURL = "";

        var unlockPeashooter:Dto_PlantInfo = new Dto_PlantInfo();
        unlockPeashooter.plantId = 1;
        unlockPeashooter.isNew = true;
        unlockPeashooter.avatarId = 1;
        unlockPeashooter.strengthLevel = 200;
        testMessage.unlockPlantList = [ unlockPeashooter ];

        testMessage.unLockSpecialPlant = [];
        testMessage.ticket = 5;
        testMessage.presentTicket = 1;
        testMessage.fame = 20;
        testMessage.buyEnergyNum = 20;
        testMessage.hasNewFormationPos = false;
        testMessage.fosterTicket = 2;
        testMessage.isEquipAttachEnabled = false;
        testMessage.regTime = 1616938347;
        testMessage.serverOpenTime = 1616851947;
        testMessage.regRoleSystemOpenTime = 1616851947;
        testMessage.isPlayZoneTask = false;
        testMessage.forbidCardAwaken = false;
        testMessage.contribVal = 15;
        testMessage.lastPayTime = 1616941947;

        var iactivelimitgrade:Dto_ServerConfig = new Dto_ServerConfig();
        iactivelimitgrade.id = "iactivelimitgrade";
        iactivelimitgrade.value = "1";
        var iWorldChatCoolDown:Dto_ServerConfig = new Dto_ServerConfig();
        iWorldChatCoolDown.id = "iWorldChatCoolDown";
        iWorldChatCoolDown.value = "1";
        var iRecoverEnergyInterval:Dto_ServerConfig = new Dto_ServerConfig();
        iRecoverEnergyInterval.id = "iRecoverEnergyInterval";
        iRecoverEnergyInterval.value = "1";
        var iRecoverEnergyPerInterval:Dto_ServerConfig = new Dto_ServerConfig();
        iRecoverEnergyPerInterval.id = "iRecoverEnergyPerInterval";
        iRecoverEnergyPerInterval.value = "1";
        var iEnergyBuyTimes:Dto_ServerConfig = new Dto_ServerConfig();
        iEnergyBuyTimes.id = "iEnergyBuyTimes";
        iEnergyBuyTimes.value = "1";
        var iWorldBossInspireParam:Dto_ServerConfig = new Dto_ServerConfig();
        iWorldBossInspireParam.id = "iWorldBossInspireParam";
        iWorldBossInspireParam.value = "1";
        var iUnlockCardRecycle:Dto_ServerConfig = new Dto_ServerConfig();
        iUnlockCardRecycle.id = "iUnlockCardRecycle";
        iUnlockCardRecycle.value = "1";
        testMessage.serverConfig = [
            iactivelimitgrade,
            iWorldChatCoolDown,
            iRecoverEnergyInterval,
            iRecoverEnergyPerInterval,
            iEnergyBuyTimes,
            iWorldBossInspireParam,
            iUnlockCardRecycle
        ];

        testMessage.seqId = 1;
        testMessage.newOfflineReward = false;

        var date:uint = new Date().time;
        testMessage.now = date;

        testData.socketDataCmdName = Cmd_Init_SC.$MessageID;

        testData.socketData = testMessage;
        testData.retCode = 0;

        loginhax.serverDataHandler(testData)
    }
}
}
