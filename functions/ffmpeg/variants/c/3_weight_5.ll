; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_5.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_5.c"
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
  %edge = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  store i32 %blen, ptr %blen.addr, align 4
  store i32 %offset, ptr %offset.addr, align 4
  store i32 0, ptr %d, align 4
  store i32 0, ptr %edge, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32, ptr %i.addr, align 4
  %1 = load i32, ptr %offset.addr, align 4
  %mul = mul nsw i32 2, %1
  %cmp = icmp slt i32 %0, %mul
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %2 = load i32, ptr %i.addr, align 4
  store i32 %2, ptr %d, align 4
  store i32 1, ptr %edge, align 4
  br label %do.end

if.end:                                           ; preds = %do.body
  %3 = load i32, ptr %i.addr, align 4
  %4 = load i32, ptr %blen.addr, align 4
  %sub = sub nsw i32 %4, 1
  %5 = load i32, ptr %offset.addr, align 4
  %mul1 = mul nsw i32 2, %5
  %sub2 = sub nsw i32 %sub, %mul1
  %cmp3 = icmp sgt i32 %3, %sub2
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.end
  %6 = load i32, ptr %blen.addr, align 4
  %sub5 = sub nsw i32 %6, 1
  %7 = load i32, ptr %i.addr, align 4
  %sub6 = sub nsw i32 %sub5, %7
  store i32 %sub6, ptr %d, align 4
  store i32 1, ptr %edge, align 4
  br label %do.end

if.end7:                                          ; preds = %if.end
  br label %do.end

do.end:                                           ; preds = %if.end7, %if.then4, %if.then
  %8 = load i32, ptr %edge, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.end9, label %if.then8

if.then8:                                         ; preds = %do.end
  store i32 8, ptr %retval, align 4
  br label %return

if.end9:                                          ; preds = %do.end
  %9 = load i32, ptr %offset.addr, align 4
  %cmp10 = icmp eq i32 %9, 1
  br i1 %cmp10, label %if.then11, label %if.end15

if.then11:                                        ; preds = %if.end9
  %10 = load i32, ptr %d, align 4
  %tobool12 = icmp ne i32 %10, 0
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.then11
  store i32 5, ptr %retval, align 4
  br label %return

if.end14:                                         ; preds = %if.then11
  store i32 3, ptr %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.end9
  %11 = load i32, ptr %d, align 4
  %mul16 = mul nsw i32 6, %11
  %12 = load i32, ptr %offset.addr, align 4
  %add = add nsw i32 %mul16, %12
  %sub17 = sub nsw i32 %add, 1
  %13 = load i32, ptr %offset.addr, align 4
  %mul18 = mul nsw i32 2, %13
  %sub19 = sub nsw i32 %mul18, 1
  %div = sdiv i32 %sub17, %sub19
  %add20 = add nsw i32 1, %div
  store i32 %add20, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end15, %if.end14, %if.then13, %if.then8
  %14 = load i32, ptr %retval, align 4
  ret i32 %14
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
