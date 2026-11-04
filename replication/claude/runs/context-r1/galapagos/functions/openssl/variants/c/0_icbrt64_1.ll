; ModuleID = '/home/liolsen/galapagos-replication/functions/openssl/variants/c/0_icbrt64_1.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/openssl/variants/c/0_icbrt64_1.c"
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
  %i = alloca i32, align 4
  %s = alloca i32, align 4
  %b = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 0, ptr %r, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 22
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4
  %mul = mul nsw i32 3, %1
  %sub = sub nsw i32 63, %mul
  store i32 %sub, ptr %s, align 4
  %2 = load i64, ptr %r, align 8
  %shl = shl i64 %2, 1
  store i64 %shl, ptr %r, align 8
  %3 = load i64, ptr %r, align 8
  %mul1 = mul i64 3, %3
  %4 = load i64, ptr %r, align 8
  %mul2 = mul i64 %mul1, %4
  %5 = load i64, ptr %r, align 8
  %mul3 = mul i64 3, %5
  %add = add i64 %mul2, %mul3
  %add4 = add i64 %add, 1
  store i64 %add4, ptr %b, align 8
  %6 = load i64, ptr %x.addr, align 8
  %7 = load i32, ptr %s, align 4
  %sh_prom = zext i32 %7 to i64
  %shr = lshr i64 %6, %sh_prom
  %8 = load i64, ptr %b, align 8
  %cmp5 = icmp uge i64 %shr, %8
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %9 = load i64, ptr %b, align 8
  %10 = load i32, ptr %s, align 4
  %sh_prom6 = zext i32 %10 to i64
  %shl7 = shl i64 %9, %sh_prom6
  %11 = load i64, ptr %x.addr, align 8
  %sub8 = sub i64 %11, %shl7
  store i64 %sub8, ptr %x.addr, align 8
  %12 = load i64, ptr %r, align 8
  %add9 = add i64 %12, 1
  store i64 %add9, ptr %r, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %13 = load i32, ptr %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %14 = load i64, ptr %r, align 8
  %mul10 = mul i64 %14, 4096
  ret i64 %mul10
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
