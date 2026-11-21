; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-openssl-baseline-r3/functions/openssl/variants/c/0_icbrt64_9.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-openssl-baseline-r3/functions/openssl/variants/c/0_icbrt64_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i64 @icbrt64(i64 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @icbrt64(i64 noundef %x) #0 {
entry:
  %x.addr = alloca i64, align 8
  %r = alloca i64, align 8
  %place = alloca i64, align 8
  %digit = alloca i32, align 4
  %candidate = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 0, ptr %r, align 8
  store i64 1000000, ptr %place, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i64, ptr %place, align 8
  %tobool = icmp ne i64 %0, 0
  br i1 %tobool, label %for.body, label %for.end8

for.body:                                         ; preds = %for.cond
  store i32 9, ptr %digit, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, ptr %digit, align 4
  %cmp = icmp ne i32 %1, 0
  br i1 %cmp, label %for.body2, label %for.end

for.body2:                                        ; preds = %for.cond1
  %2 = load i64, ptr %r, align 8
  %3 = load i32, ptr %digit, align 4
  %conv = zext i32 %3 to i64
  %4 = load i64, ptr %place, align 8
  %mul = mul i64 %conv, %4
  %add = add i64 %2, %mul
  store i64 %add, ptr %candidate, align 8
  %5 = load i64, ptr %candidate, align 8
  %6 = load i64, ptr %x.addr, align 8
  %7 = load i64, ptr %candidate, align 8
  %div = udiv i64 %6, %7
  %8 = load i64, ptr %candidate, align 8
  %div3 = udiv i64 %div, %8
  %cmp4 = icmp ule i64 %5, %div3
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %for.body2
  %9 = load i64, ptr %candidate, align 8
  store i64 %9, ptr %r, align 8
  br label %for.end

if.end:                                           ; preds = %for.body2
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32, ptr %digit, align 4
  %dec = add i32 %10, -1
  store i32 %dec, ptr %digit, align 4
  br label %for.cond1, !llvm.loop !6

for.end:                                          ; preds = %if.then, %for.cond1
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %11 = load i64, ptr %place, align 8
  %div7 = udiv i64 %11, 10
  store i64 %div7, ptr %place, align 8
  br label %for.cond, !llvm.loop !8

for.end8:                                         ; preds = %for.cond
  %12 = load i64, ptr %r, align 8
  %shl = shl i64 %12, 12
  ret i64 %shl
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
