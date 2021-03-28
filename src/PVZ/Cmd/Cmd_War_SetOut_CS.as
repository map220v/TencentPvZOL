package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_War_SetOut_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_War_SetOut_CS";
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_War_SetOut_CS.type","type",1 << 3 | WireType.VARINT);
      
      public static const TARGETPOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_War_SetOut_CS.targetPos","targetPos",2 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const TEAMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_War_SetOut_CS.teamId","teamId",3 << 3 | WireType.VARINT);
       
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var targetPos$field:Dto_WorldMap_Pos;
      
      private var teamId$field:uint;
      
      public function Cmd_War_SetOut_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_War_SetOut_CS.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearTargetPos() : void
      {
         this.targetPos$field = null;
      }
      
      public function get hasTargetPos() : Boolean
      {
         return this.targetPos$field != null;
      }
      
      public function set targetPos(param1:Dto_WorldMap_Pos) : void
      {
         this.targetPos$field = param1;
      }
      
      public function get targetPos() : Dto_WorldMap_Pos
      {
         return this.targetPos$field;
      }
      
      public function clearTeamId() : void
      {
         this.hasField$0 &= 4294967293;
         this.teamId$field = new uint();
      }
      
      public function get hasTeamId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set teamId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.teamId$field = param1;
      }
      
      public function get teamId() : uint
      {
         return this.teamId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasTargetPos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.targetPos$field);
         }
         if(this.hasTeamId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.teamId$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_War_SetOut_CS.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_War_SetOut_CS.targetPos cannot be set twice.");
                  }
                  _loc4_++;
                  this.targetPos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.targetPos);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_War_SetOut_CS.teamId cannot be set twice.");
                  }
                  _loc5_++;
                  this.teamId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
