package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GuildFight_FightQueue_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildFight_FightQueue_SC";
      
      public static const WAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_FightQueue_SC.way","way",1 << 3 | WireType.VARINT);
      
      public static const LEFTCLASHROLE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFight_FightQueue_SC.leftClashRole","leftClashRole",2 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFight_RoleInfo);
      
      public static const RIGHTCLASHROLE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFight_FightQueue_SC.rightClashRole","rightClashRole",3 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFight_RoleInfo);
      
      public static const LEFTROLENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_FightQueue_SC.leftRoleNum","leftRoleNum",4 << 3 | WireType.VARINT);
      
      public static const RIGHTROLENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_FightQueue_SC.rightRoleNum","rightRoleNum",5 << 3 | WireType.VARINT);
       
      
      private var way$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var leftClashRole:Array;
      
      public var rightClashRole:Array;
      
      private var leftRoleNum$field:uint;
      
      private var rightRoleNum$field:uint;
      
      public function Cmd_GuildFight_FightQueue_SC()
      {
         this.leftClashRole = [];
         this.rightClashRole = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildFight_FightQueue_SC.$MessageID;
      }
      
      public function clearWay() : void
      {
         this.hasField$0 &= 4294967294;
         this.way$field = new uint();
      }
      
      public function get hasWay() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set way(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.way$field = param1;
      }
      
      public function get way() : uint
      {
         return this.way$field;
      }
      
      public function clearLeftRoleNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.leftRoleNum$field = new uint();
      }
      
      public function get hasLeftRoleNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set leftRoleNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.leftRoleNum$field = param1;
      }
      
      public function get leftRoleNum() : uint
      {
         return this.leftRoleNum$field;
      }
      
      public function clearRightRoleNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.rightRoleNum$field = new uint();
      }
      
      public function get hasRightRoleNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set rightRoleNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.rightRoleNum$field = param1;
      }
      
      public function get rightRoleNum() : uint
      {
         return this.rightRoleNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasWay)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.way$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.leftClashRole.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.leftClashRole[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.rightClashRole.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rightClashRole[_loc3_]);
            _loc3_++;
         }
         if(this.hasLeftRoleNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.leftRoleNum$field);
         }
         if(this.hasRightRoleNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.rightRoleNum$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_FightQueue_SC.way cannot be set twice.");
                  }
                  _loc3_++;
                  this.way = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.leftClashRole.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFight_RoleInfo()));
                  break;
               case 3:
                  this.rightClashRole.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFight_RoleInfo()));
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_FightQueue_SC.leftRoleNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftRoleNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_FightQueue_SC.rightRoleNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.rightRoleNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
