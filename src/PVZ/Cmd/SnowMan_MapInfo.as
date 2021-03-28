package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class SnowMan_MapInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.SnowMan_MapInfo";
      
      public static const MAPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.SnowMan_MapInfo.mapId","mapId",1 << 3 | WireType.VARINT);
      
      public static const PLANTID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.SnowMan_MapInfo.plantId","plantId",2 << 3 | WireType.VARINT);
       
      
      private var mapId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var plantId:Array;
      
      public function SnowMan_MapInfo()
      {
         this.plantId = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return SnowMan_MapInfo.$MessageID;
      }
      
      public function clearMapId() : void
      {
         this.hasField$0 &= 4294967294;
         this.mapId$field = new uint();
      }
      
      public function get hasMapId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set mapId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.mapId$field = param1;
      }
      
      public function get mapId() : uint
      {
         return this.mapId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasMapId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.mapId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.plantId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.plantId[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: SnowMan_MapInfo.mapId cannot be set twice.");
                  }
                  _loc3_++;
                  this.mapId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if((_loc4_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.plantId);
                  }
                  else
                  {
                     this.plantId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
