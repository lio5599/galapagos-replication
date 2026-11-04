; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @weight(i32 noundef 0, i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @weight(i32 noundef %i, i32 noundef %blen, i32 noundef %offset) #0 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %blen.addr = alloca i32, align 4
  %offset.addr = alloca i32, align 4
  %d = alloca i32, align 4
  %lo = alloca i32, align 4
  %hi = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  store i32 %blen, ptr %blen.addr, align 4
  store i32 %offset, ptr %offset.addr, align 4
  %0 = load i32, ptr %i.addr, align 4
  %1 = load i32, ptr %offset.addr, align 4
  %mul = mul nsw i32 2, %1
  %cmp = icmp slt i32 %0, %mul
  %conv = zext i1 %cmp to i32
  store i32 %conv, ptr %lo, align 4
  %2 = load i32, ptr %lo, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %entry
  %3 = load i32, ptr %i.addr, align 4
  %4 = load i32, ptr %blen.addr, align 4
  %sub = sub nsw i32 %4, 1
  %5 = load i32, ptr %offset.addr, align 4
  %mul1 = mul nsw i32 2, %5
  %sub2 = sub nsw i32 %sub, %mul1
  %cmp3 = icmp sgt i32 %3, %sub2
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %6 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ]
  %land.ext = zext i1 %6 to i32
  store i32 %land.ext, ptr %hi, align 4
  %7 = load i32, ptr %lo, align 4
  %tobool5 = icmp ne i32 %7, 0
  br i1 %tobool5, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %land.end
  %8 = load i32, ptr %hi, align 4
  %tobool6 = icmp ne i32 %8, 0
  br i1 %tobool6, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  store i32 8, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %land.end
  %9 = load i32, ptr %lo, align 4
  %tobool7 = icmp ne i32 %9, 0
  br i1 %tobool7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %10 = load i32, ptr %i.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %11 = load i32, ptr %blen.addr, align 4
  %sub8 = sub nsw i32 %11, 1
  %12 = load i32, ptr %i.addr, align 4
  %sub9 = sub nsw i32 %sub8, %12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %10, %cond.true ], [ %sub9, %cond.false ]
  store i32 %cond, ptr %d, align 4
  %13 = load i32, ptr %offset.addr, align 4
  %cmp10 = icmp ne i32 %13, 1
  br i1 %cmp10, label %if.then12, label %if.end18

if.then12:                                        ; preds = %cond.end
  %14 = load i32, ptr %d, align 4
  %mul13 = mul nsw i32 6, %14
  %15 = load i32, ptr %offset.addr, align 4
  %add = add nsw i32 %mul13, %15
  %sub14 = sub nsw i32 %add, 1
  %16 = load i32, ptr %offset.addr, align 4
  %mul15 = mul nsw i32 2, %16
  %sub16 = sub nsw i32 %mul15, 1
  %div = sdiv i32 %sub14, %sub16
  %add17 = add nsw i32 1, %div
  store i32 %add17, ptr %retval, align 4
  br label %return

if.end18:                                         ; preds = %cond.end
  %17 = load i32, ptr %d, align 4
  %cmp19 = icmp eq i32 %17, 0
  %18 = zext i1 %cmp19 to i64
  %cond21 = select i1 %cmp19, i32 3, i32 5
  store i32 %cond21, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end18, %if.then12, %if.then
  %19 = load i32, ptr %retval, align 4
  ret i32 %19
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
