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
   
   public final class Cmd_Temple_SetOut_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Temple_SetOut_CS";
      
      public static const POS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Temple_SetOut_CS.pos","pos",1 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const TEAMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Temple_SetOut_CS.teamId","teamId",2 << 3 | WireType.VARINT);
      
      public static const AREA:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Temple_SetOut_CS.area","area",3 << 3 | WireType.VARINT);
       
      
      private var pos$field:Dto_WorldMap_Pos;
      
      private var teamId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var area$field:uint;
      
      public function Cmd_Temple_SetOut_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Temple_SetOut_CS.$MessageID;
      }
      
      public function clearPos() : void
      {
         this.pos$field = null;
      }
      
      public function get hasPos() : Boolean
      {
         return this.pos$field != null;
      }
      
      public function set pos(param1:Dto_WorldMap_Pos) : void
      {
         this.pos$field = param1;
      }
      
      public function get pos() : Dto_WorldMap_Pos
      {
         return this.pos$field;
      }
      
      public function clearTeamId() : void
      {
         this.hasField$0 &= 4294967294;
         this.teamId$field = new uint();
      }
      
      public function get hasTeamId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set teamId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.teamId$field = param1;
      }
      
      public function get teamId() : uint
      {
         return this.teamId$field;
      }
      
      public function clearArea() : void
      {
         this.hasField$0 &= 4294967293;
         this.area$field = new uint();
      }
      
      public function get hasArea() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set area(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.area$field = param1;
      }
      
      public function get area() : uint
      {
         return this.area$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.pos$field);
         }
         if(this.hasTeamId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.teamId$field);
         }
         if(this.hasArea)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.area$field);
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
                     throw new IOError("Bad data format: Cmd_Temple_SetOut_CS.pos cannot be set twice.");
                  }
                  _loc3_++;
                  this.pos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.pos);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Temple_SetOut_CS.teamId cannot be set twice.");
                  }
                  _loc4_++;
                  this.teamId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Temple_SetOut_CS.area cannot be set twice.");
                  }
                  _loc5_++;
                  this.area = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
