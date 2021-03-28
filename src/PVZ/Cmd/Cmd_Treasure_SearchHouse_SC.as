package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Treasure_SearchHouse_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Treasure_SearchHouse_SC";
      
      public static const TREASUREHOUSE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Treasure_SearchHouse_SC.treasureHouse","treasureHouse",1 << 3 | WireType.LENGTH_DELIMITED,Dto_TreasureHouse);
       
      
      private var treasureHouse$field:Dto_TreasureHouse;
      
      public function Cmd_Treasure_SearchHouse_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Treasure_SearchHouse_SC.$MessageID;
      }
      
      public function clearTreasureHouse() : void
      {
         this.treasureHouse$field = null;
      }
      
      public function get hasTreasureHouse() : Boolean
      {
         return this.treasureHouse$field != null;
      }
      
      public function set treasureHouse(param1:Dto_TreasureHouse) : void
      {
         this.treasureHouse$field = param1;
      }
      
      public function get treasureHouse() : Dto_TreasureHouse
      {
         return this.treasureHouse$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTreasureHouse)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.treasureHouse$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_Treasure_SearchHouse_SC.treasureHouse cannot be set twice.");
                  }
                  _loc3_++;
                  this.treasureHouse = new Dto_TreasureHouse();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.treasureHouse);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
