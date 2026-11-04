; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_4.c"
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
  store i32 %i, ptr %i.addr, align 4
  store i32 %blen, ptr %blen.addr, align 4
  store i32 %offset, ptr %offset.addr, align 4
  %0 = load i32, ptr %i.addr, align 4
  %1 = load i32, ptr %offset.addr, align 4
  %mul = mul nsw i32 2, %1
  %cmp = icmp slt i32 %0, %mul
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %i.addr, align 4
  store i32 %2, ptr %d, align 4
  br label %if.end8

if.else:                                          ; preds = %entry
  %3 = load i32, ptr %i.addr, align 4
  %4 = load i32, ptr %blen.addr, align 4
  %sub = sub nsw i32 %4, 1
  %5 = load i32, ptr %offset.addr, align 4
  %mul1 = mul nsw i32 2, %5
  %sub2 = sub nsw i32 %sub, %mul1
  %cmp3 = icmp sgt i32 %3, %sub2
  br i1 %cmp3, label %if.then4, label %if.else7

if.then4:                                         ; preds = %if.else
  %6 = load i32, ptr %blen.addr, align 4
  %sub5 = sub nsw i32 %6, 1
  %7 = load i32, ptr %i.addr, align 4
  %sub6 = sub nsw i32 %sub5, %7
  store i32 %sub6, ptr %d, align 4
  br label %if.end

if.else7:                                         ; preds = %if.else
  store i32 8, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then4
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  %8 = load i32, ptr %offset.addr, align 4
  switch i32 %8, label %sw.default [
    i32 1, label %sw.bb
  ]

sw.bb:                                            ; preds = %if.end8
  %9 = load i32, ptr %d, align 4
  %cmp9 = icmp ne i32 %9, 0
  %conv = zext i1 %cmp9 to i32
  %mul10 = mul nsw i32 2, %conv
  %add = add nsw i32 3, %mul10
  store i32 %add, ptr %retval, align 4
  br label %return

sw.default:                                       ; preds = %if.end8
  %10 = load i32, ptr %d, align 4
  %mul11 = mul nsw i32 6, %10
  %11 = load i32, ptr %offset.addr, align 4
  %add12 = add nsw i32 %mul11, %11
  %sub13 = sub nsw i32 %add12, 1
  %12 = load i32, ptr %offset.addr, align 4
  %mul14 = mul nsw i32 2, %12
  %sub15 = sub nsw i32 %mul14, 1
  %div = sdiv i32 %sub13, %sub15
  %add16 = add nsw i32 1, %div
  store i32 %add16, ptr %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb, %if.else7
  %13 = load i32, ptr %retval, align 4
  ret i32 %13
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
