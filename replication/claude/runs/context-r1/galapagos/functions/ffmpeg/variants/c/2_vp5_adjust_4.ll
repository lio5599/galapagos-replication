; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_4.c"
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
  %v.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %sign = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  %1 = zext i1 %cmp to i64
  %cond = select i1 %cmp, i32 -1, i32 1
  store i32 %cond, ptr %sign, align 4
  %2 = load i32, ptr %sign, align 4
  %3 = load i32, ptr %v.addr, align 4
  %mul = mul nsw i32 %2, %3
  store i32 %mul, ptr %a, align 4
  %4 = load i32, ptr %a, align 4
  %5 = load i32, ptr %t.addr, align 4
  %mul1 = mul nsw i32 2, %5
  %cmp2 = icmp slt i32 %4, %mul1
  br i1 %cmp2, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, ptr %a, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %t.addr, align 4
  %cmp3 = icmp sgt i32 %6, %7
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %8 = load i32, ptr %t.addr, align 4
  %mul5 = mul nsw i32 2, %8
  %9 = load i32, ptr %a, align 4
  %sub = sub nsw i32 %mul5, %9
  store i32 %sub, ptr %a, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %10 = load i32, ptr %sign, align 4
  %11 = load i32, ptr %a, align 4
  %mul7 = mul nsw i32 %10, %11
  ret i32 %mul7
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
