; ModuleID = '/home/liolsen/galapagos-replication/functions/openssl/variants/c/0_icbrt64_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/openssl/variants/c/0_icbrt64_9.c"
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
  %s = alloca i32, align 4
  %d = alloca i64, align 8
  %b = alloca i64, align 8
  %taken = alloca i32, align 4
  store i64 %x, ptr %x.addr, align 8
  store i64 0, ptr %r, align 8
  store i32 63, ptr %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %s, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, ptr %r, align 8
  %mul = mul i64 %1, 2
  store i64 %mul, ptr %d, align 8
  %2 = load i64, ptr %d, align 8
  %mul1 = mul i64 3, %2
  %3 = load i64, ptr %d, align 8
  %add = add i64 %3, 1
  %mul2 = mul i64 %mul1, %add
  %add3 = add i64 %mul2, 1
  store i64 %add3, ptr %b, align 8
  %4 = load i64, ptr %x.addr, align 8
  %5 = load i32, ptr %s, align 4
  %sh_prom = zext i32 %5 to i64
  %shr = lshr i64 %4, %sh_prom
  %6 = load i64, ptr %b, align 8
  %cmp4 = icmp uge i64 %shr, %6
  %conv = zext i1 %cmp4 to i32
  store i32 %conv, ptr %taken, align 4
  %7 = load i32, ptr %taken, align 4
  %tobool = icmp ne i32 %7, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %8 = load i64, ptr %x.addr, align 8
  %9 = load i64, ptr %b, align 8
  %10 = load i32, ptr %s, align 4
  %sh_prom5 = zext i32 %10 to i64
  %shl = shl i64 %9, %sh_prom5
  %sub = sub i64 %8, %shl
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %11 = load i64, ptr %x.addr, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ %11, %cond.false ]
  store i64 %cond, ptr %x.addr, align 8
  %12 = load i64, ptr %d, align 8
  %13 = load i32, ptr %taken, align 4
  %conv6 = sext i32 %13 to i64
  %add7 = add i64 %12, %conv6
  store i64 %add7, ptr %r, align 8
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %14 = load i32, ptr %s, align 4
  %sub8 = sub nsw i32 %14, 3
  store i32 %sub8, ptr %s, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %15 = load i64, ptr %r, align 8
  %mul9 = mul i64 %15, 4096
  ret i64 %mul9
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
