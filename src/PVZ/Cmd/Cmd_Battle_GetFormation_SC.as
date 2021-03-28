package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Battle_GetFormation_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Battle_GetFormation_SC";
      
      public static const FORMATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Battle_GetFormation_SC.formation","formation",1 << 3 | WireType.LENGTH_DELIMITED,Dto_FormationInfo);
      
      public static const TEAM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Battle_GetFormation_SC.team","team",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FormationInfo);
      
      public static const TEAMMAXNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Battle_GetFormation_SC.teamMaxNum","teamMaxNum",3 << 3 | WireType.VARINT);
      
      public static const DEFAULTTEAMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Battle_GetFormation_SC.defaultTeamId","defaultTeamId",4 << 3 | WireType.VARINT);
       
      
      private var formation$field:Dto_FormationInfo;
      
      public var team:Array;
      
      private var teamMaxNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var defaultTeamId$field:uint;
      
      public function Cmd_Battle_GetFormation_SC()
      {
         this.team = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Battle_GetFormation_SC.$MessageID;
      }
      
      public function clearFormation() : void
      {
         this.formation$field = null;
      }
      
      public function get hasFormation() : Boolean
      {
         return this.formation$field != null;
      }
      
      public function set formation(param1:Dto_FormationInfo) : void
      {
         this.formation$field = param1;
      }
      
      public function get formation() : Dto_FormationInfo
      {
         return this.formation$field;
      }
      
      public function clearTeamMaxNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.teamMaxNum$field = new uint();
      }
      
      public function get hasTeamMaxNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set teamMaxNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.teamMaxNum$field = param1;
      }
      
      public function get teamMaxNum() : uint
      {
         return this.teamMaxNum$field;
      }
      
      public function clearDefaultTeamId() : void
      {
         this.hasField$0 &= 4294967293;
         this.defaultTeamId$field = new uint();
      }
      
      public function get hasDefaultTeamId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set defaultTeamId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.defaultTeamId$field = param1;
      }
      
      public function get defaultTeamId() : uint
      {
         return this.defaultTeamId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasFormation)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.formation$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.team.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.team[_loc2_]);
            _loc2_++;
         }
         if(this.hasTeamMaxNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.teamMaxNum$field);
         }
         if(this.hasDefaultTeamId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.defaultTeamId$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_Battle_GetFormation_SC.formation cannot be set twice.");
                  }
                  _loc3_++;
                  this.formation = new Dto_FormationInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.formation);
                  break;
               case 2:
                  this.team.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FormationInfo()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Battle_GetFormation_SC.teamMaxNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.teamMaxNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Battle_GetFormation_SC.defaultTeamId cannot be set twice.");
                  }
                  _loc5_++;
                  this.defaultTeamId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
