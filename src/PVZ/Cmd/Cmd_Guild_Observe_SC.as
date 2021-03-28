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
   
   public final class Cmd_Guild_Observe_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Guild_Observe_SC";
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Guild_Observe_SC.baseInfo","baseInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_BaseInfo);
      
      public static const OCCUPYCIRCUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Guild_Observe_SC.occupyCircus","occupyCircus",2 << 3 | WireType.VARINT);
      
      public static const OCCUPYPLAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Guild_Observe_SC.occupyPlay","occupyPlay",3 << 3 | WireType.VARINT);
       
      
      private var baseInfo$field:Dto_Guild_BaseInfo;
      
      private var occupyCircus$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var occupyPlay$field:uint;
      
      public function Cmd_Guild_Observe_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Guild_Observe_SC.$MessageID;
      }
      
      public function clearBaseInfo() : void
      {
         this.baseInfo$field = null;
      }
      
      public function get hasBaseInfo() : Boolean
      {
         return this.baseInfo$field != null;
      }
      
      public function set baseInfo(param1:Dto_Guild_BaseInfo) : void
      {
         this.baseInfo$field = param1;
      }
      
      public function get baseInfo() : Dto_Guild_BaseInfo
      {
         return this.baseInfo$field;
      }
      
      public function clearOccupyCircus() : void
      {
         this.hasField$0 &= 4294967294;
         this.occupyCircus$field = new uint();
      }
      
      public function get hasOccupyCircus() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set occupyCircus(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.occupyCircus$field = param1;
      }
      
      public function get occupyCircus() : uint
      {
         return this.occupyCircus$field;
      }
      
      public function clearOccupyPlay() : void
      {
         this.hasField$0 &= 4294967293;
         this.occupyPlay$field = new uint();
      }
      
      public function get hasOccupyPlay() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set occupyPlay(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.occupyPlay$field = param1;
      }
      
      public function get occupyPlay() : uint
      {
         return this.occupyPlay$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBaseInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.baseInfo$field);
         }
         if(this.hasOccupyCircus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.occupyCircus$field);
         }
         if(this.hasOccupyPlay)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.occupyPlay$field);
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
                     throw new IOError("Bad data format: Cmd_Guild_Observe_SC.baseInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.baseInfo = new Dto_Guild_BaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guild_Observe_SC.occupyCircus cannot be set twice.");
                  }
                  _loc4_++;
                  this.occupyCircus = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guild_Observe_SC.occupyPlay cannot be set twice.");
                  }
                  _loc5_++;
                  this.occupyPlay = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
