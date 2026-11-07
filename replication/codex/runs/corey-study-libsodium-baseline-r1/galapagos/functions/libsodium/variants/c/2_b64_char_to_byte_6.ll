; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %masks = alloca [5 x i32], align 16
  %values = alloca [5 x i32], align 16
  %x = alloca i32, align 4
  %bit = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %arrayinit.begin = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 0
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  store i32 %not, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 122, %4
  %or4 = or i32 %sub2, %sub3
  %shr5 = lshr i32 %or4, 8
  %not6 = xor i32 %shr5, -1
  store i32 %not6, ptr %arrayinit.element, align 4
  %arrayinit.element7 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %5 = load i32, ptr %u, align 4
  %sub8 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub9 = sub i32 57, %6
  %or10 = or i32 %sub8, %sub9
  %shr11 = lshr i32 %or10, 8
  %not12 = xor i32 %shr11, -1
  store i32 %not12, ptr %arrayinit.element7, align 4
  %arrayinit.element13 = getelementptr inbounds i32, ptr %arrayinit.element7, i64 1
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub14 = sub i32 0, %xor
  %shr15 = lshr i32 %sub14, 8
  %not16 = xor i32 %shr15, -1
  store i32 %not16, ptr %arrayinit.element13, align 4
  %arrayinit.element17 = getelementptr inbounds i32, ptr %arrayinit.element13, i64 1
  %8 = load i32, ptr %u, align 4
  %xor18 = xor i32 %8, 47
  %sub19 = sub i32 0, %xor18
  %shr20 = lshr i32 %sub19, 8
  %not21 = xor i32 %shr20, -1
  store i32 %not21, ptr %arrayinit.element17, align 4
  %arrayinit.begin22 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 0
  %9 = load i32, ptr %u, align 4
  %sub23 = sub i32 %9, 65
  store i32 %sub23, ptr %arrayinit.begin22, align 4
  %arrayinit.element24 = getelementptr inbounds i32, ptr %arrayinit.begin22, i64 1
  %10 = load i32, ptr %u, align 4
  %sub25 = sub i32 %10, 97
  %add = add i32 %sub25, 26
  store i32 %add, ptr %arrayinit.element24, align 4
  %arrayinit.element26 = getelementptr inbounds i32, ptr %arrayinit.element24, i64 1
  %11 = load i32, ptr %u, align 4
  %sub27 = sub i32 %11, 48
  %add28 = add i32 %sub27, 52
  store i32 %add28, ptr %arrayinit.element26, align 4
  %arrayinit.element29 = getelementptr inbounds i32, ptr %arrayinit.element26, i64 1
  store i32 62, ptr %arrayinit.element29, align 4
  %arrayinit.element30 = getelementptr inbounds i32, ptr %arrayinit.element29, i64 1
  store i32 63, ptr %arrayinit.element30, align 4
  store i32 0, ptr %x, align 4
  store i32 1, ptr %bit, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc39, %entry
  %12 = load i32, ptr %bit, align 4
  %cmp = icmp ule i32 %12, 128
  br i1 %cmp, label %for.body, label %for.end40

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc, %for.body
  %13 = load i32, ptr %i, align 4
  %cmp32 = icmp ult i32 %13, 5
  br i1 %cmp32, label %for.body33, label %for.end

for.body33:                                       ; preds = %for.cond31
  %14 = load i32, ptr %i, align 4
  %idxprom = zext i32 %14 to i64
  %arrayidx = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 %idxprom
  %15 = load i32, ptr %arrayidx, align 4
  %16 = load i32, ptr %i, align 4
  %idxprom34 = zext i32 %16 to i64
  %arrayidx35 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 %idxprom34
  %17 = load i32, ptr %arrayidx35, align 4
  %and = and i32 %15, %17
  %18 = load i32, ptr %bit, align 4
  %and36 = and i32 %and, %18
  %cmp37 = icmp ne i32 %and36, 0
  br i1 %cmp37, label %if.then, label %if.end

if.then:                                          ; preds = %for.body33
  %19 = load i32, ptr %bit, align 4
  %20 = load i32, ptr %x, align 4
  %or38 = or i32 %20, %19
  store i32 %or38, ptr %x, align 4
  br label %for.end

if.end:                                           ; preds = %for.body33
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %21 = load i32, ptr %i, align 4
  %inc = add i32 %21, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond31, !llvm.loop !6

for.end:                                          ; preds = %if.then, %for.cond31
  br label %for.inc39

for.inc39:                                        ; preds = %for.end
  %22 = load i32, ptr %bit, align 4
  %shl = shl i32 %22, 1
  store i32 %shl, ptr %bit, align 4
  br label %for.cond, !llvm.loop !8

for.end40:                                        ; preds = %for.cond
  %23 = load i32, ptr %x, align 4
  %tobool = icmp ne i32 %23, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end40
  %24 = load i32, ptr %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.end40
  %25 = load i32, ptr %u, align 4
  %xor41 = xor i32 %25, 65
  %sub42 = sub i32 0, %xor41
  %shr43 = lshr i32 %sub42, 8
  %and44 = and i32 %shr43, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %24, %cond.true ], [ %and44, %cond.false ]
  ret i32 %cond
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
