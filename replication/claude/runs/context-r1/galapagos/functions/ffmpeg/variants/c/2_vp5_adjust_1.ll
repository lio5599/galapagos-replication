; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_1.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @vp5_adjust(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @vp5_adjust(i32 noundef %v, i32 noundef %t) #0 {
entry:
  %retval = alloca i32, align 4
  %v.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %v.addr, align 4
  %2 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %2
  %cmp1 = icmp sge i32 %1, %mul
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i32 0, ptr %v.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %3 = load i32, ptr %v.addr, align 4
  %4 = load i32, ptr %t.addr, align 4
  %cmp3 = icmp slt i32 %3, %4
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %5 = load i32, ptr %v.addr, align 4
  store i32 %5, ptr %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  %6 = load i32, ptr %t.addr, align 4
  %mul6 = mul nsw i32 2, %6
  %7 = load i32, ptr %v.addr, align 4
  %sub = sub nsw i32 %mul6, %7
  store i32 %sub, ptr %retval, align 4
  br label %return

if.end7:                                          ; preds = %entry
  %8 = load i32, ptr %v.addr, align 4
  %sub8 = sub nsw i32 0, %8
  store i32 %sub8, ptr %v.addr, align 4
  %9 = load i32, ptr %v.addr, align 4
  %10 = load i32, ptr %t.addr, align 4
  %mul9 = mul nsw i32 2, %10
  %cmp10 = icmp sge i32 %9, %mul9
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end7
  store i32 0, ptr %v.addr, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end7
  %11 = load i32, ptr %v.addr, align 4
  %12 = load i32, ptr %t.addr, align 4
  %cmp13 = icmp slt i32 %11, %12
  br i1 %cmp13, label %if.then14, label %if.end16

if.then14:                                        ; preds = %if.end12
  %13 = load i32, ptr %v.addr, align 4
  %sub15 = sub nsw i32 0, %13
  store i32 %sub15, ptr %retval, align 4
  br label %return

if.end16:                                         ; preds = %if.end12
  %14 = load i32, ptr %v.addr, align 4
  %15 = load i32, ptr %t.addr, align 4
  %mul17 = mul nsw i32 2, %15
  %sub18 = sub nsw i32 %14, %mul17
  store i32 %sub18, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end16, %if.then14, %if.end5, %if.then4
  %16 = load i32, ptr %retval, align 4
  ret i32 %16
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
