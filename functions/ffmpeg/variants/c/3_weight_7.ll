; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_7.c"
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
  %inLeft = alloca i32, align 4
  %inRight = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  store i32 %blen, ptr %blen.addr, align 4
  store i32 %offset, ptr %offset.addr, align 4
  %0 = load i32, ptr %i.addr, align 4
  %1 = load i32, ptr %offset.addr, align 4
  %mul = mul nsw i32 2, %1
  %cmp = icmp slt i32 %0, %mul
  %conv = zext i1 %cmp to i32
  store i32 %conv, ptr %inLeft, align 4
  %2 = load i32, ptr %i.addr, align 4
  %3 = load i32, ptr %blen.addr, align 4
  %sub = sub nsw i32 %3, 1
  %4 = load i32, ptr %offset.addr, align 4
  %mul1 = mul nsw i32 2, %4
  %sub2 = sub nsw i32 %sub, %mul1
  %cmp3 = icmp sgt i32 %2, %sub2
  %conv4 = zext i1 %cmp3 to i32
  store i32 %conv4, ptr %inRight, align 4
  %5 = load i32, ptr %inLeft, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %6 = load i32, ptr %inRight, align 4
  %tobool5 = icmp ne i32 %6, 0
  br i1 %tobool5, label %if.then, label %if.end19

if.then:                                          ; preds = %lor.lhs.false, %entry
  %7 = load i32, ptr %inLeft, align 4
  %tobool6 = icmp ne i32 %7, 0
  br i1 %tobool6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %8 = load i32, ptr %i.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %9 = load i32, ptr %blen.addr, align 4
  %sub7 = sub nsw i32 %9, 1
  %10 = load i32, ptr %i.addr, align 4
  %sub8 = sub nsw i32 %sub7, %10
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %8, %cond.true ], [ %sub8, %cond.false ]
  store i32 %cond, ptr %d, align 4
  %11 = load i32, ptr %offset.addr, align 4
  %cmp9 = icmp eq i32 %11, 1
  br i1 %cmp9, label %if.then11, label %if.end

if.then11:                                        ; preds = %cond.end
  %12 = load i32, ptr %d, align 4
  %tobool12 = icmp ne i32 %12, 0
  %13 = zext i1 %tobool12 to i64
  %cond13 = select i1 %tobool12, i32 5, i32 3
  store i32 %cond13, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %14 = load i32, ptr %d, align 4
  %mul14 = mul nsw i32 6, %14
  %15 = load i32, ptr %offset.addr, align 4
  %add = add nsw i32 %mul14, %15
  %sub15 = sub nsw i32 %add, 1
  %16 = load i32, ptr %offset.addr, align 4
  %mul16 = mul nsw i32 2, %16
  %sub17 = sub nsw i32 %mul16, 1
  %div = sdiv i32 %sub15, %sub17
  %add18 = add nsw i32 %div, 1
  store i32 %add18, ptr %retval, align 4
  br label %return

if.end19:                                         ; preds = %lor.lhs.false
  store i32 8, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end19, %if.end, %if.then11
  %17 = load i32, ptr %retval, align 4
  ret i32 %17
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
