package PVZ.Cmd
{
   import PVZ.Protocol.Dto_CardFormation;
   import PVZ.Protocol.Dto_FightSideInfo;
   import PVZ.Protocol.Dto_PuppetFormation;
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_AllServerRankArenaRoleInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_AllServerRankArenaRoleInfo";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_AllServerRankArenaRoleInfo.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const FIGHTSIDE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_AllServerRankArenaRoleInfo.fightSide","fightSide",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FightSideInfo);
      
      public static const CARDFORMATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_AllServerRankArenaRoleInfo.cardFormation","cardFormation",3 << 3 | WireType.LENGTH_DELIMITED,Dto_CardFormation);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerRankArenaRoleInfo.power","power",4 << 3 | WireType.VARINT);
      
      public static const PUPPETFORMATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_AllServerRankArenaRoleInfo.puppetFormation","puppetFormation",5 << 3 | WireType.LENGTH_DELIMITED,PVZ.Protocol.Dto_PuppetFormation);
       
      
      private var roleId$field:Int64;
      
      private var fightSide$field:Dto_FightSideInfo;
      
      private var cardFormation$field:Dto_CardFormation;
      
      private var power$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var puppetFormation$field:PVZ.Protocol.Dto_PuppetFormation;
      
      public function Dto_AllServerRankArenaRoleInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_AllServerRankArenaRoleInfo.$MessageID;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
      }
      
      public function clearFightSide() : void
      {
         this.fightSide$field = null;
      }
      
      public function get hasFightSide() : Boolean
      {
         return this.fightSide$field != null;
      }
      
      public function set fightSide(param1:Dto_FightSideInfo) : void
      {
         this.fightSide$field = param1;
      }
      
      public function get fightSide() : Dto_FightSideInfo
      {
         return this.fightSide$field;
      }
      
      public function clearCardFormation() : void
      {
         this.cardFormation$field = null;
      }
      
      public function get hasCardFormation() : Boolean
      {
         return this.cardFormation$field != null;
      }
      
      public function set cardFormation(param1:Dto_CardFormation) : void
      {
         this.cardFormation$field = param1;
      }
      
      public function get cardFormation() : Dto_CardFormation
      {
         return this.cardFormation$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967294;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      public function clearPuppetFormation() : void
      {
         this.puppetFormation$field = null;
      }
      
      public function get hasPuppetFormation() : Boolean
      {
         return this.puppetFormation$field != null;
      }
      
      public function set puppetFormation(param1:PVZ.Protocol.Dto_PuppetFormation) : void
      {
         this.puppetFormation$field = param1;
      }
      
      public function get puppetFormation() : PVZ.Protocol.Dto_PuppetFormation
      {
         return this.puppetFormation$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasFightSide)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.fightSide$field);
         }
         if(this.hasCardFormation)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardFormation$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         if(this.hasPuppetFormation)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.puppetFormation$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArenaRoleInfo.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArenaRoleInfo.fightSide cannot be set twice.");
                  }
                  _loc4_++;
                  this.fightSide = new Dto_FightSideInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.fightSide);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArenaRoleInfo.cardFormation cannot be set twice.");
                  }
                  _loc5_++;
                  this.cardFormation = new Dto_CardFormation();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.cardFormation);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArenaRoleInfo.power cannot be set twice.");
                  }
                  _loc6_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArenaRoleInfo.puppetFormation cannot be set twice.");
                  }
                  _loc7_++;
                  this.puppetFormation = new PVZ.Protocol.Dto_PuppetFormation();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.puppetFormation);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
