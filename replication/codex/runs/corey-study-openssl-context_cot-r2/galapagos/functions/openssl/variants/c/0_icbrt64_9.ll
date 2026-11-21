; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-openssl-context_cot-r2/functions/openssl/variants/c/0_icbrt64_9.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-openssl-context_cot-r2/functions/openssl/variants/c/0_icbrt64_9.c"
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
  %b = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 0, ptr %r, align 8
  store i32 63, ptr %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %s, align 4
  %cmp = icmp sge i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, ptr %r, align 8
  %shl = shl i64 %1, 1
  store i64 %shl, ptr %r, align 8
  %2 = load i64, ptr %r, align 8
  %mul = mul i64 3, %2
  %3 = load i64, ptr %r, align 8
  %add = add i64 %3, 1
  %mul1 = mul i64 %mul, %add
  %add2 = add i64 %mul1, 1
  store i64 %add2, ptr %b, align 8
  %4 = load i64, ptr %x.addr, align 8
  %5 = load i32, ptr %s, align 4
  %sh_prom = zext i32 %5 to i64
  %shr = lshr i64 %4, %sh_prom
  %6 = load i64, ptr %b, align 8
  %cmp3 = icmp uge i64 %shr, %6
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %7 = load i64, ptr %b, align 8
  %8 = load i32, ptr %s, align 4
  %sh_prom4 = zext i32 %8 to i64
  %shl5 = shl i64 %7, %sh_prom4
  %9 = load i64, ptr %x.addr, align 8
  %sub = sub i64 %9, %shl5
  store i64 %sub, ptr %x.addr, align 8
  %10 = load i64, ptr %r, align 8
  %inc = add i64 %10, 1
  store i64 %inc, ptr %r, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %11 = load i64, ptr %r, align 8
  %shl6 = shl i64 %11, 1
  store i64 %shl6, ptr %r, align 8
  %12 = load i64, ptr %r, align 8
  %mul7 = mul i64 3, %12
  %13 = load i64, ptr %r, align 8
  %add8 = add i64 %13, 1
  %mul9 = mul i64 %mul7, %add8
  %add10 = add i64 %mul9, 1
  store i64 %add10, ptr %b, align 8
  %14 = load i64, ptr %x.addr, align 8
  %15 = load i32, ptr %s, align 4
  %sub11 = sub nsw i32 %15, 3
  %sh_prom12 = zext i32 %sub11 to i64
  %shr13 = lshr i64 %14, %sh_prom12
  %16 = load i64, ptr %b, align 8
  %cmp14 = icmp uge i64 %shr13, %16
  br i1 %cmp14, label %if.then15, label %if.end21

if.then15:                                        ; preds = %if.end
  %17 = load i64, ptr %b, align 8
  %18 = load i32, ptr %s, align 4
  %sub16 = sub nsw i32 %18, 3
  %sh_prom17 = zext i32 %sub16 to i64
  %shl18 = shl i64 %17, %sh_prom17
  %19 = load i64, ptr %x.addr, align 8
  %sub19 = sub i64 %19, %shl18
  store i64 %sub19, ptr %x.addr, align 8
  %20 = load i64, ptr %r, align 8
  %inc20 = add i64 %20, 1
  store i64 %inc20, ptr %r, align 8
  br label %if.end21

if.end21:                                         ; preds = %if.then15, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end21
  %21 = load i32, ptr %s, align 4
  %sub22 = sub nsw i32 %21, 6
  store i32 %sub22, ptr %s, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %22 = load i64, ptr %r, align 8
  %shl23 = shl i64 %22, 12
  ret i64 %shl23
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
